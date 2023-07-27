---
title: General Computer Setup 
permalink: generalsetup.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: July 11, 2022
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

### UPDATE - Zscaler

While the VPN options mentioned below might still work, ZScaler will soon be the default and preferred VPN.
You can already try it if you have `sudo` permissions:

    sudo salt-call state.apply client.zscaler
    sudo systemctl restart zsaservice.service zstunnel.service

### legacy VPNs

(TODO update the rest of this section)

We currently have three options to vpn into Mercedes-Benz Corporate Network. One recent "GREEN2GO" is faster and removes Proxy-Requirement - but it needs sudo interaction of the users.

You can see the instructions for Green2Go on the Github Project Readme: [https://git.i.mercedes-benz.com/Ubuntu-Tools/green](https://git.i.mercedes-benz.com/Ubuntu-Tools/green)

The two legacy access variants work out of the box. Both use a connection via openconnect through a Juniper Pulse gateway.

### Certificate-authenticated access

All new enrolled systems come with a set of certificates for the usage of VPN and Wifi / WLAN. All systems have a VPN GUI preinstalled called "Daimler VPN"

![vpn_1](images/docs/general_setup/vpn_1.png) ![vpn_2](images/docs/general_setup/vpn_2.png)

After starting the GUI, you can connect by selecting "Connection" → "Start Daimler-VPN"

Alternatively, run daimler-vpn on a console.

### Ping.ID authenticated access

Your user must be granted to use AlwaysOn (AlwaysOn User (EMEA) (QEV111AGDB8A)) and afterwards you are able to login to the "Token" VPN by typing the 6 digit One-Time Passcode of the Ping.ID app.

![Ping.ID](images/docs/general_setup/ping.png)

#### Connect to VPN

![vpn_3](images/docs/general_setup/vpn_3.png)

1. ensure VPN is not already connected
2. select the region you want to connect to
3. start token dialog

![vpn_4](images/docs/general_setup/vpn_4.png)

## WLAN / Wifi

All new enrolled systems come with a set of certificates for the usage of VPN and Wifi / WLAN. To use a wifi connection select SITECONNECTRD to connect to Daimler RD network. If you are prompted for any password or configuration, something went wrong with the configuration of your computer. Please contact the Linux support via [ticket]({{ site.baseurl }}/tickets.html).

