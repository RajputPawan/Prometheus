---
title: The ultimate guide to your domain password change
permalink: domain_password_change.html
sidebar: default_sidebar
tags: [docs, domain]
keywords: [password, passwd, kpasswd, domain, change]
last_updated: January 10, 2024
toc: false
folder: docs
---


### Introduction

Windows AD Domain integration in the current Ubuntu RD environment has several moving parts. Understanding them, or at least knowing they exist, can save a lot of troubleshooting time and unnecessary headaches.

That being said, if you just want to know how to properly change your domain password from your MB Ubuntu OS, scroll down for the [TL;DR-compliant version](#how-to-properly-change-your-domain-password)


### Main Ubuntu domain client components

- **krb5 user tools**[^1][^2]  
  Used for Kerberos Authentication against corporate AD
- **OpenLDAP client utilities**[^3]  
  Configured as Identity provider, connects to the OpenLDAP infrastructure which mirrors a subset of OUs / Objects from AD to provide User and Group information
- **sssd**[^4]  
  Domain Users and Groups caching middleware
- **NSS**[^5] configuration and required **PAM**[^6] modules(pam_krb5[^7], pam_sss[^8]) to enforce domain-based authentication and authorization
- **Autofs**[^9]  
  Automounter service configured to use LDAP based mounts
- Couple of useful utilities(adcli, msktutil, ..)
- And a few salt configuration states and ad modules to ensure things stay glued together in a reproducible auditable way

### Authentication process

This summary does not aim to be comprehensive in any way, nor 100% accurate.

Whenever you authenticate to your computer (for example via sshd or a Desktop Manager login screen), you start your authentication and authorization journey hitting your systems NSS lookup function. NSS will try to get the user details of the user logging in.

Where to look for them is defined system-wide in `/etc/nsswitch.conf`, in our case(truncated output):

```bash
passwd: files sss
shadow: files sss
automount: sss
```

The above means, first look in local files (`/etc/passwd, /etc/group`), then fallback to SSSD.

Ubuntu RD OS images are configured to use domain credentials exclusively\*. SSSD will retrieve user details from a (randomized) list of OpenLDAP slave servers, which may vary depending on your clients location. We also configure Kerberos as the primary authentication provider and configure sssd to cache account (nss), authentication (pam) and domain credential information.  
Here is the simplified `/etc/sssd/sssd.conf`:

```bash
[sssd]
..
services = nss, pam, ifp, autofs
..
[pam]
cache_first = true
..
[nss]
cache_first = true
..
[domain/..]
..
cache_credentials = true
krb5_ccname_template = FILE:/tmp/krb5cc_%U

..
id_provider = ldap
auth_provider = krb5
chpass_provider = krb5
..
krb5_store_password_if_offline = true # Will store the TGT
ldap_uri = ldap://ldap02.rd.corpintra.net,ldap://ldap03.rd.corpintra.net,ldap://ldap01.rd.corpintra.net
```

As SSSD caches user details on-demand, and can only do a LDAP lookup (for an unknown user) when OpenLDAP servers are reachable, its important to always first login to a newly-installed system while it is connected to the corporate NW (can be done via SSH) if you plan to work from a remote location.

Once your sshd or Desktop Manager successfully fetches your user details, it will by default continue the authentication process using the Linux PAM subsystem[^6]. PAM configuration is split into 4 main categories. Below a summary in the order of execution:

- **authentication**, `/etc/pam.d/common-auth`, common user authentication rules
- **account**, `/etc/pam.d/common-account`, user authorization (evaluates whether the authenticated user is allowed to logon, when, to what services)
- **session**, `/etc/pam.d/common-session`, user session management (fe. modules run at the beginning or end of a session)
- **password**, `/etc/pam.d/common-password`, triggered when manipulating passwords

Every PAM-based authentication attempt is evaluated based on a set of PAM configuration rules specified in each pam.d configuration file.

The interesting part for the auth itself is defined (dynamically*) at `/etc/pam.d/common-auth`
```bash
auth	[success=5 default=ignore]	pam_krb5.so minimum_uid=1000
auth	[success=4 default=ignore]	pam_unix.so nullok try_first_pass
auth	[success=3 default=ignore]	pam_sss.so use_first_pass
auth	[success=2 default=ignore]	pam_ccreds.so minimum_uid=1000 action=validate use_first_pass
auth	[default=ignore]		pam_ccreds.so minimum_uid=1000 action=update
# here's the fallback if no module succeeds
auth	requisite			pam_deny.so
# prime the stack with a positive return value if there isn't one already;
# this avoids us returning an error just because nothing sets a success code
# since the modules above will each just jump around
auth	required			pam_permit.so
# and here are more per-package modules (the "Additional" block)
auth	required            pam_group.so
auth	optional			pam_ccreds.so minimum_uid=1000 action=store
auth	optional			pam_cap.so
```

The above translated to human language:

- You start authenticating using the pam_krb5[^7] module, this will try to hit the AD Kerberos server as defined in `/etc/krb5.conf`[^1] (let me spare you the gory details)
- If your authentication succeeds, PAM will skip the next 5 modules and continue with pam_permit - as the name suggests - allowing access. It will also run the pam_group, pam_ccreds[^10][^11] and pam_cap module - pam_ccreds being the interesting one because its used to manage, and in this case **also store your credentials in its own local cache**
- If your authentication against pam_krb5[^7] fails(lets say in case you are offline), the next module in line will be run, in this case pam_unix, to authenticate using a local user (skipping the next 4 modules on success)
- If pam_unix fails, your authentication will continue by querying SSSD using the pam_sss module[^8]. This is where you'd usually hit your sssd credential cache(not pam_ccreds)
- The last fallback uses pam_ccreds, but pam_ccreds only caches passwords so even if you still have your password stored in the systems local cache, without a valid user info provider, your authentication will fail

One note regarding sudo, as of writing of this document [2024/01], sudo is configured to not use PAM to create a session when running a command due to the changes in how the latest sudo release handles kerberos ticket cache.

The real picture is slightly more complicated as SSSD also caches nss lookups and PAM authentication results, but you probably can already guess that given the complexity highlighted above, its fairly easy to end up in an inconsistent state after a domain password change.


### Password change

To avoid possible issues related to your user password, the [recommended way to change a domain user password](#how-to-properly-change-your-domain-password) in our setup is to use the `kpasswd` utility[^12]. Some may argue that using `passwd`[^13] has worked and still works just as well, and as this would for most users be the default \*nix way to change a password, lets do small detour why it works in the first place.

When you run `passwd`, the PAM module configuration `/etc/pam.d/passwd`` will be read:

```bash
@include common-password
```

`/etc/pam.d/common-password` in our setup looks as follows(truncated):

```bash
password	requisite			pam_pwquality.so retry=3
password	[success=3 default=ignore]	pam_krb5.so minimum_uid=1000 try_first_pass use_authtok
password	[success=2 default=ignore]	pam_unix.so obscure use_authtok try_first_pass yescrypt
password	sufficient			pam_sss.so use_authtok
password	requisite			pam_deny.so
password	required			pam_permit.so
password	optional	pam_gnome_keyring.so
```

As you can probably see now (ignoring most of the module details), passwd first triggers the pam_pwquality module, then pam_krb5 (for UID ≥ 1000, skips the next 3 on success), and only if not successful falls-back to the default pam_unix.so module (which would fail by default) and pam_sss (which would again trigger a sssd-based krb5 password change because of `chpass_provider = krb5` configured in sssd.conf for the domain).

Using `kpasswd` will directly read your `/etc/krb5.conf` to talk to the configured domain(TGS) and fail right away on error (which is what we want in our setup). As krb5 uses the same credential (TGT) cache as sssd (FILE:/tmp/krb5cc_%U), it will update/trigger an update without a potential PAM roundtrip. To also update your pam_ccreds cache, you would need to trigger the common-auth module somehow - which is where your favorite screen-saver comes into the picture:

```
$ cat /etc/pam.d/gnome-screensaver
@include common-auth
auth optional pam_gnome_keyring.so
```

Now that you have some idea of the general process :)

### How to (properly) change your domain password

- Make sure you are connected to the MB NW (directly or via VPN)
- Use `kpasswd`, enter your old and your new password once prompted
- **Lock your screen** (this windows-y step is important!)
- Unlock your screen **using your new credentials**

## References

[^1]: [https://linux.die.net/man/5/krb5.conf](https://linux.die.net/man/5/krb5.conf)
[^2]: [https://ubuntu.com/server/docs/service-kerberos-workstation-auth](https://ubuntu.com/server/docs/service-kerberos-workstation-auth)
[^3]: [https://www.openldap.org/](https://www.openldap.org/)
[^4]: [https://sssd.io/](https://sssd.io/)
[^5]: [https://man7.org/linux/man-pages/man5/nsswitch.conf.5.html](https://man7.org/linux/man-pages/man5/nsswitch.conf.5.html)
[^6]: [https://man7.org/linux/man-pages/man8/pam.8.html](https://man7.org/linux/man-pages/man8/pam.8.html)
[^7]: [https://linux.die.net/man/8/pam_krb5](https://linux.die.net/man/8/pam_krb5)
[^8]: [https://linux.die.net/man/8/pam_sss](https://linux.die.net/man/8/pam_sss)
[^9]: [https://help.ubuntu.com/community/Autofs](https://help.ubuntu.com/community/Autofs)
[^10]: [https://github.com/PADL/pam_ccreds](https://github.com/PADL/pam_ccreds)
[^11]: [https://help.ubuntu.com/community/PamCcredsHowto](https://help.ubuntu.com/community/PamCcredsHowto)
[^12]: [https://linux.die.net/man/1/kpasswd](https://linux.die.net/man/1/kpasswd)
[^13]: [https://man7.org/linux/man-pages/man1/passwd.1.html](https://man7.org/linux/man-pages/man1/passwd.1.html)
