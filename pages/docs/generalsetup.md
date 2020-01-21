---
title: General Computer Setup 
permalink: generalsetup.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: January 21, 2020
toc: true
folder: docs
---

### Disk Encryption
Your computer is encrypted with an initial crypto passphrase. At first boot please unlock your computer with this password:

`InitialCryptPW`

Disk encryption is done with cryptsetup Luks. You will be asked for a password on each boot and are prompted to change the boot-password the first time you login. You can change the boot-password by issuing the following command in a terminal.
```
changeCryptKey-gui
```

Please do not delete or modify Key Slot #7. This is an admin slot for recovery if you forget your password.

### Windows terminalserver

### E-Mail

### Sudo

### VPN

#### Certificate-authenticated access

#### Token authenticated access

### WLAN / Wifi

### Share data between Linux and Windows

