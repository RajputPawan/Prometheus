---
title: General Computer Setup 
permalink: generalsetup.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: January 23, 2020
toc: true
folder: docs
---

## Disk Encryption

Your computer is encrypted with an initial crypto passphrase. At first boot please unlock your computer with this password:

`InitialCryptPW`

Disk encryption is done with cryptsetup Luks. You will be asked for a password on each boot and are prompted to change the boot-password the first time you login. You can change the boot-password by issuing the following command in a terminal.

```bash
changeCryptKey-gui
```

Please do not delete or modify Key Slot #7. This is an admin slot for recovery in case you have forgotten your password.

## Windows terminalserver
Currently there is no solution to read encrypted e-mails on Linux. Therefore every Linux user needs access to MS Outlook on a Windows computer where she/he will be able to read and write encrypted emails.

In Daimler RD the standard way for Linux users is to use the GEW (Global Engineering Workplace). It is a Windows Terminal Server Solution accessible via Citrix client.

Access to GEW is ordered through ITShop with QEV Number 20019810 (GEW-Basic-RD WTS ZUGANG SIFI - CD-ID) for Daimler employees.

To use GEW, login to [https://gew.rd.corpintra.net/vpn/index.html](https://gew.rd.corpintra.net/vpn/index.html) , select Desktops and then GEW Basic RD -WTS2012-RD-

![gew_picture](images/docs/general_setup/gew_picture.png)

To be able to use your microphone and camera in GEW you need to change the default configuration by running the Citrix configmanager and change Mic & Webcam configuration:

```bash
/opt/Citrix/ICAClient/util/configmgr
```

![citrix_recv](images/docs/general_setup/citrix_recv.png)

## E-Mail

As of today there is no officially supported email client on Linux. You can access your email and calendar with these solutions:

1. Use Outlook on [Terminalserver / GEW](#windows-terminalserver) or on a Windows pc
2. Use the Outlook WebAccess: [https://webmail.wp.corpshared.net](https://webmail.wp.corpshared.net/owa/) (encrypted email not supported)
3. Use Evolution with EWS Plugin (encrypted email not supported)
4. Use Thunderbird with EWS Plugin (encrypted email not supported)

## Sudo

In order to be allowed to obtain local admin rights, the following asset must be placed in the IT shop: QEV111AFGPI4 (DL DOKUMENTATION BEDINGUNGEN FUER LOK. ADMINRECHTE)
After this asset was ordered for your user, you will be asked to sign a digital version of the terms of use.

In addition there must be ordered the QEV111AH31LR (DL CLIENT ADMIN USER UBUNTU) to your computer to gain sudo on this machine.

## VPN

At the moment there are two possibilities to get access to the DCN (Daimler Corporate Network). Both use a connection via openconnect through a Juniper Pulse gateway.

### Certificate-authenticated access

All new enrolled systems come with a set of certificates for the usage of VPN and Wifi / WLAN. All systems have a VPN GUI preinstalled called "Daimler VPN"

![vpn_1](images/docs/general_setup/vpn_1.png) ![vpn_2](images/docs/general_setup/vpn_2.png)

After starting the GUI, you can connect by selecting "Connection" → "Start Daimler-VPN"

Alternatively, run daimler-vpn on a console.

### Token authenticated access

To use this solution you need a token assigned to your user in IT-Shop (TOKEN VASCO (QEV111ADPGMA)). Additionally your user must be granted to use AlwaysOn (AlwaysOn User (EMEA) (QEV111AGDB8A))

![token](images/docs/general_setup/token.png)

#### Initialize Token

After you received your token you must change your initial PIN:

1. open [https://emea-cug.sra.corpshared.net/dana-na/auth/url_1/welcome.cgi"](https://emea-cug.sra.corpshared.net/dana-na/auth/url_1/welcome.cgi)
2. type your username (must look like this: "emea.corpdir.net/$USER")
3. as password use the following pattern: `<Startpin><Tokennumber><Newpin><Newpin>`

If your StartPIN is 1234, the token display shows number 8765432 and you new PIN should be 5831 the Password for the first time is: 1234876543258315831

After successfully changing your PIN you can test the correct PIN by logging in to the website again using `<PIN><Tokennumber>` as password.

#### Connect to VPN

Now your token is ready to use.

![vpn_3](images/docs/general_setup/vpn_3.png)

1. ensure VPN is not already connected
2. select the region you want to connect to
3. start token dialog

![vpn_4](images/docs/general_setup/vpn_4.png)

## WLAN / Wifi

All new enrolled systems come with a set of certificates for the usage of VPN and Wifi / WLAN. To use a wifi connection select SITECONNECTRD to connect to Daimler RD network. If you are prompted for any password or configuration, something went wrong with the configuration of your computer. Please contact the Linux support via [ticket]({{ site.baseurl }}/tickets.html).

## Share data between Linux and Windows

All Linux systems share the local filesystem with the local homes through samba. So it is available on Windows hosts. In Windows Explorer you can open `\\%linux_hostname%.rd.corpintra.net\fs1` to access your local home and exchange data between the two worlds.

![home_win](images/docs/general_setup/home_win.png)

If you want to mount your shared home directory (home, not local home directory lhome), you can do so as well. This has the advantage that you have your files ready on any workstation instead of just the one you used when you uploaded the files.

On Windows:
`\\dfshks.rd.corpintra.net\dfsroot\home\<UserID>`

On Linux:
`cd /home/$USER`

Note that this Folder is not mounted by default, but instead gets mounted on usage.
