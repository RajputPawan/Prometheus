---
title: Local Admin Rights
permalink: local_admin_rights.html
sidebar: default_sidebar
tags: [docs]
keywords: admin_rights
last_updated: February 3, 2020
toc: true
folder: docs
---

## How to gain admin rights

Similar to Windows local admin rights for a Ubuntu computer can be ordered through ITShop:

`DL CLIENT ADMIN USER UBUNTU (QEV111AH31LR)`

The following general documentation has to be ordered and agreed to before:

`DL DOKUMENTATION BEDINGUNGEN FUER LOK. ADMINRECHTE (QEV111AFGPI4)`

Further information about the duties and restrictions that apply can be found here:

[https://social.intra.corpintra.net/docs/DOC-148313](https://social.intra.corpintra.net/docs/DOC-148313)

## Restrictions for local admins

Local admins need to be carefull what they do on their system.

### What is allowed in general

* Installation of sofware that is supplied by the pre-configured sources of apt (No PPA) as long as this software does not conflict with other software that was installed by the base system.
* Modification of configurations in Userspace (/lhome /home)
* Mounting additional resources like NFS or USB devices.
* Adding systemd-units for userspace (`systemctl --user`)
* Modification of configuration in /etc, but only on software that you installed by yourself.

### What is not allowed in general

* Adding local users
* Adding sudo to other users
* Changing system wide configuration --> this applies to all what is located in /etc. Especially apt, sudoers, sssd, salt, sophos, pam, nsswitch, profile, environment...
* Updating / changing pre-installed drivers. E.g. nvidia
* Installation of additional software to the system with other package management systems like pip / npm / snap... Install it to userspace or somewhere in /opt and add it to your $PATH.
* Playing around with uidNumbers and trying to access data of other users.

### What happens if you don't respect those rules

* Sudo / admin rights can be revoked for you (forever)
* If you break your system or the config-management the provider will have your system reinstalled with a base installation.
