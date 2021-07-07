---
title: Sudo / Local Admin Rights
permalink: local_admin_rights.html
sidebar: default_sidebar
tags: [docs]
keywords: admin_rights
last_updated: September 9, 2020
toc: true
folder: docs
---

## How to gain admin rights

Similar to Windows local admin rights for a Ubuntu computer can be ordered through ITShop:

`DL CLIENT ADMIN USER UBUNTU (QEV111AH31LR)`

> **`NOTE`:** Multiple/Additional admin rights can also be ordered for a single machine in ITShop.

The following general documentation has to be ordered and agreed to beforehand:

`DL DOKUMENTATION BEDINGUNGEN FUER LOK. ADMINRECHTE (QEV111AFGPI4)`

Further information about the duties and restrictions that apply can be found here:

[https://social.intra.corpintra.net/docs/DOC-148313](https://social.intra.corpintra.net/docs/DOC-148313)

### Exception: for India, China, MBRDNA and DTNA

The former process via ['Sudo form'](images/docs/sudo_local_admin/gewaehrung_lokaler_administrationsrechte_ee_final_en_v2019-08-22_wireshark_mehrfach_sudo.pdf) and approval by the E5 is still active.

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
* Changing system wide configuration --> this applies to all what is located in /etc. Especially apt, sudoers, sssd, salt, sophos, pam, nsswitch, profile, environment, /etc/hosts ...
* Updating / changing pre-installed drivers. E.g. nvidia
* Installation of additional software to the system with other package management systems like pip / npm / snap... Install it to userspace or somewhere in /opt and add it to your $PATH.
* Playing around with uidNumbers and trying to access data of other users.

### What happens if you don't respect those rules

* Sudo / admin rights can be revoked for you (forever)
* If you break your system or the config-management the provider will have your system reinstalled with a base installation.

### Usage of Wireshark and package sniffers

The usage of wireshark and other package sniffing tools is not allowed. There is an exception for this if you request a special approval at ISO Office RD and don't use those tools on the interface that is connected to Daimler network.

You can request the usage of Wireshark and sniffing tools for debugging on interfaces that are for example connected to HiL computers, control units or other (embedded) devices. To get a special approval please sent an email to [ISO Office RD](mailto:mbox-059-iso-office-rd@daimler.com?subject=Requesting%20usage%20of%20wireshark%20on%20my%20Ubuntu%20computer&body=Hello%20ISO%20Office%20RD%2C%0A%0AI%27m%20requesting%20the%20usage%20of%20wireshark%20and%20package%20sniffers%20on%20my%20computer%20for%20debugging%20connections.%0A%0AI%20will%20not%20use%20these%20tools%20to%20sniff%20on%20the%20interfaces%20that%20are%20connected%20to%20Daimler%20networks.%0A%0AMy%20usecase%20for%20justification%20is%3A%20%25JUSITIFICATION%25%0A%0AMy%20username%3A%20%25USERNAME%25%0AMy%20computer%3A%20%25HOSTNAME%25%0A%0ABest%20regards%2C%0A%25NAME%25) and include your Username, Computername that will be used and the justification why you want to do that.
