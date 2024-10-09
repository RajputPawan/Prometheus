---
title: reinstall-os
permalink: reinstall-os.html
sidebar: default_sidebar
tags: [docs]
keywords: reinstallation, upgrade, downgrade, ubuntu20, ubuntu22
last_updated: Oct 09, 2024
toc: true
folder: docs
---

## Reinstall system with reinstall-os

The reinstall-os.sh script allows you to reinstall, upgrade, or downgrade the Ubuntu system on your client machine without the need for a boot device or onsite support.
  
**‼**{: style="color: red"} **IMPORTANT: DURING THE REINSTALLATION, ALL DATA ON YOUR CLIENT DEVICE WILL BE ERASED!!!**
Ensure you have backups of all important data before using this script.
**‼**{: style="color: red"}

### Requirements

Ensure your client device is directly connected to the MB network via an Ethernet cable (eth0). The reinstall-os.sh script will not proceed if:

- The client device is not connected to the MB network
- The connection is through VPN
- The connection is via Wi-Fi

### Using reinstall-os script

To initiate the reinstall process, execute:

```bash
reinstall-os.sh
```

The script will display different options depending on the OS version it’s being run on:
- Upgrade/installation of Ubuntu 22.04 (Jammy) and 24.04 (Noble) is supported from all previous OS versions.
![reinstall-os](images/docs/reinstall-os/reinstall-os-v3.3.png)
(img 2.1)

- You can also use the reinstall-os script to switch between different OS flavors without performing a full reinstallation, applicable for both Jammy and Noble.
![reinstall-os](images/docs/reinstall-os/reinstall-os-v3.1.png)
(img 2.2)
![reinstall-os](images/docs/reinstall-os/reinstall-os-v3.2.png)
(img 2.3)

### Notes

**🛈**{: style="color: blue"} Ubuntu 22.04 (Jammy) and Ubuntu 24.04 (Noble) are supported only on systems configured with UEFI firmware.

**🛈**{: style="color: blue"} Ubuntu 22.04 (Jammy) and Ubuntu 24.04 (Noble) vanilla flavors pre-install a limited set of packages, so it is recommended to book sudoers permissions in IT support before opting for these installation types.

**🛈**{: style="color: blue"} It is recommended to review the Release Notes before installing this OS version.  
- **[Ubuntu 22.04 (Jammy)](./2022-11-03-jammy.html)**  
- **[Ubuntu 24.04 (Noble)](./2024-09-05-noble.html)**

**🛈**{: style="color: blue"} Please do not turn off your client device during the installation process. The system will reboot automatically!

**🛈**{: style="color: blue"} During the installation you will see the message **"Initial system configuration"** on the terminal display. Initial system configuration can take **approx. 1 hour** to complete

**🛈**{: style="color: blue"} Installation may trigger several reboots to complete
