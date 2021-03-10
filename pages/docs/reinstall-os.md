---
title: reinstall-os
permalink: reinstall-os.html
sidebar: default_sidebar
tags: [docs]
keywords: reinstallation, upgrade, downgrade, ubuntu20
last_updated: Feb 22, 2021
toc: true
folder: docs
---

## Reinstall System via reinstall-os

Using the reinstall-os.sh script, makes it possible to reinstall, upgrade or downgrade the Ubuntu system which is installed on your client machine,without using a boot device and without Onsite support.


**‼**{: style="color: red"} **PLEASE BE AWARE, THAT DURING THE REINSTALLATION ALL DATA ON YOUR CLIENT DEVICE WILL BE COMPLETELY ERASED!** Make sure you have backups of all your important data, if you want to use this script! **‼**{: style="color: red"}


### Requirements

Please make sure, that your client device is directly connected to the Daimler network via ethernet cable (eth0).

The reinstall-os.sh script won't start if:
- The client device is not connected to the Daimler network
- The client device is connected via VPN
- The client device is connected via Wifi

**⚠**{: style="color: darkorange"} The user who wants to use the script, needs sudo rights on the client device


### Using reinstall-os script

execute script:

```bash
reinstall-os.sh
```

**🛈**{: style="color: blue"} Please wait for a few seconds, the script has to determine a few variables from different sources


After the script has been successfully loaded, a window will occur. You have the following options:

- **Reinstall System** ( available for Ubuntu 18.04, Ubuntu 20.04) => Reinstall the system with the **same OS** which is already installed (see img 1.0)

- **Reinstall/Upgrade System** ( available for Ubuntu 18.04 ) → **Reinstall and upgrade** system from **Ubuntu 18.04** to **Ubuntu 20.04** (see img 1.1)

- **Reinstall/Downgrade System** (available for Ubuntu 20.04) → **Reinstall and downgrade** system from **Ubuntu 20.04** to **Ubuntu 18.04** (see img 1.2)

![reinstall-os](images/docs/reinstall-os/reinstall-os-1.png)
(img 1.1)


![reinstall-os](images/docs/reinstall-os/reinstall-os-2.png)
(img 1.2)


After one of the above section was selected, a warning message will occur, which will inform you for the **last time**, that after continuing **ALL DATA WILL BE ERASED!** (see img 1.3)

**‼**{: style="color: red"} Please hit cancel, if you are unsure or if you forgot to create backups of your system. **‼**{: style="color: red"}

By hitting **"OK"**, the client device will **reboot automatically** after a short time and will reinstall the Ubuntu system you've selected.

![reinstall-os](images/docs/reinstall-os/reinstall-os-3.png)
(img 1.3)


**⚠**{: style="color: darkorange"} Please do not turn off your client device during the reinstallation. The system will reboot automatically!


**🛈**{: style="color: blue"} During the reinstallation you will see the message **"Initial system configuration"** on the terminal display.


After the client machine has been rebooted, the reinstallation will get started. After **approx. 1 hour**, you will receive a fresh installed system.


**🛈**{: style="color: blue"} Please be aware that fetching certificates to your client devive could remain **apporx. 1 hour** after the installation.
