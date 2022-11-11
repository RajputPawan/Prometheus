---
title: reinstall-os
permalink: reinstall-os.html
sidebar: default_sidebar
tags: [docs]
keywords: reinstallation, upgrade, downgrade, ubuntu20, ubuntu22
last_updated: Nov 09, 2022
toc: true
folder: docs
---

## Reinstall system with reinstall-os

Using the reinstall-os.sh script makes it possible to reinstall, upgrade or downgrade the Ubuntu system installed on your client machine without using a boot device and without Onsite support.  
  
**‼**{: style="color: red"} **PLEASE BE AWARE, THAT DURING THE REINSTALLATION ALL DATA ON YOUR CLIENT DEVICE WILL BE ERASED!** Make sure you have backups of all your important data before using this script **‼**{: style="color: red"}

### Requirements

Please make sure, that your client device is directly connected to the MB network via ethernet cable (eth0).
The reinstall-os.sh script won't start an installation if:

- The client device is not connected to the MB network
- The client device is connected via VPN
- The client device is connected via Wifi

### Using reinstall-os script

To initiate the reinstall process, execute:

```bash
reinstall-os.sh
```

Script will display different options deppending on the OS version its being run on:
- Upgrade/installation of Ubuntu 20.04(focal) and 22.04(jammy) is supported from all OS versions
![reinstall-os](images/docs/reinstall-os/reinstall-os-v2.1.png)
(img 2.1)

- When run on focal, script enables an experimental in-place upgrade feature to jammy
![reinstall-os](images/docs/reinstall-os/reinstall-os-v2.2.png)
(img 2.2)

- When run on jammy, you can use the reinstall-os script to switch between different OS flavors wo a full OS reinstallation
![reinstall-os](images/docs/reinstall-os/reinstall-os-v2.3.png)
(img 2.3)
![reinstall-os](images/docs/reinstall-os/reinstall-os-v2.4.png)
(img 2.4)

### Notes

**🛈**{: style="color: blue"} Ubuntu 22.04 (jammy) is only supported on systems configured with UEFI firmware

**🛈**{: style="color: blue"} Ubuntu 22.04 (jammy) vanilla flavors pre-install only a limited set of packages, it is therefore recommended to book sudoers persmissions in itshop before choosing this type of installation

**🛈**{: style="color: blue"} It is recommended to review the Ubuntu 22.04 (jammy) [release notes](./2022-11-03-jammy.html) before installing this OS version

**🛈**{: style="color: blue"} Please do not turn off your client device during the installation process. The system will reboot automatically!

**🛈**{: style="color: blue"} During the installation you will see the message **"Initial system configuration"** on the terminal display. Initial system configuration can take **approx. 1 hour** to complete

**🛈**{: style="color: blue"} Installation may trigger several reboots to complete
