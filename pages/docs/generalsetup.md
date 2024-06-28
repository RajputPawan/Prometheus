---
title: General Computer Setup 
permalink: generalsetup.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: 2024-06-28
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

## E-Mail

### Email with encryption support

1. [__GNOME Evolution__]({% link pages/docs/evolution.md %}) native email
   client, __now with S/MIME certificates!__
2. Outlook on Terminalserver / GEW] (see below) or on a company Windows
   machine
3. Another alternative with encryption support is to use the company provided
   iPhone

### Windows terminalserver (not required anymore)

In Mercedes-Benz RD the standard way for Linux users is to use the GEW (Global
Engineering Workplace). It is a Windows Terminal Server Solution accessible via
Citrix client.

Access to GEW is ordered through ITShop with QEV Number 20019810 (GEW-Basic-RD
WTS ZUGANG SIFI - CD-ID) for MB employees.

To use GEW, login to [https://gew.rd.corpintra.net/vpn/index.html](
https://gew.rd.corpintra.net/vpn/index.html), select Desktops and then GEW Basic
RD.

![gew_picture](images/docs/general_setup/gew_picture.png)

To be able to use your microphone and camera in GEW you need to change
the default configuration by running the Citrix configmanager and change
Mic & Webcam configuration:

```bash
/opt/Citrix/ICAClient/util/configmgr
```

![citrix_recv](images/docs/general_setup/citrix_recv.png)

### Email without encryption support

1. Outlook online: [https://outlook.office.com](https://outlook.office.com/)
   (no encryption/signing)
2. Use Thunderbird with EWS Plugin (not supported, no encryption/signing)

## Sudo

In order to be allowed to obtain local admin rights, the following asset must be placed in the IT shop: QEV111AFGPI4 (DL DOKUMENTATION BEDINGUNGEN FUER LOK. ADMINRECHTE)
After this asset was ordered for your user, you will be asked to sign a digital version of the terms of use.

In addition there must be ordered the QEV111AH31LR (DL CLIENT ADMIN USER UBUNTU) to your computer to gain sudo on this machine.

## VPN

### BETA - Zscaler

Zscaler VPN is currently in testing phase and is set to become the default VPN soon.
You can already try it if you have `sudo` permissions:

    sudo salt-call state.apply client.zscaler
    sudo systemctl restart zsaservice.service zstunnel.service

Authentication happens in the Zscaler Client Connector app with your
credentials.

* `<username>@<full-domain>` like `...@emea.corpdir.net`
* `<username>@mercedes-benz.com` works too. _Note that this is not
  the same as your email address!_

[See here for support information around Zscaler in our environment.](zscaler_issues.html)

### Certificate-authenticated access: alwayson (legacy option 1)

All new enrolled systems come with a set of certificates for the usage
of VPN and Wifi / WLAN. All systems have a VPN GUI for the (legacy)
VPN preinstalled called "Daimler VPN"

![vpn_1](images/docs/general_setup/vpn_1.png) ![vpn_2](images/docs/general_setup/vpn_2.png)

After starting the GUI, you can connect by selecting "Connection" → "Start Daimler-VPN"

Alternatively, run daimler-vpn on a console.

### Ping.ID authenticated access (legacy option 2)

Your user must be granted to use AlwaysOn (AlwaysOn User (EMEA) (QEV111AGDB8A)) and afterwards you are able to login to the "Token" VPN by typing the 6 digit One-Time Passcode of the Ping.ID app.

![Ping.ID](images/docs/general_setup/ping.png)

#### Connect to VPN

![vpn_3](images/docs/general_setup/vpn_3.png)

1. ensure VPN is not already connected
2. select the region you want to connect to
3. start token dialog

![vpn_4](images/docs/general_setup/vpn_4.png)

## WLAN / Wifi

All newly enrolled systems come with a set of certificates for the usage of VPN and Wifi / WLAN. For MBTI, a NON-RD location, to connect to a wifi network, select __GLOBAL CONNECT__ to access the Mercedes-Benz network. For RD locations, select __SITECONNECTRD__ to connect to the Mercedes-Benz RD network. If you are prompted for any password or additional configuration, there may be an issue with your computer’s setup. Please contact Linux support by submitting a [__Ticket__]({{ site.baseurl }}/incident.html).
