---
title: Configure MAC address pass-through with Lenovo USB-C docks 
permalink: macaddress_passthrough.html
sidebar: default_sidebar
tags: [docs]
keywords: macaddress, mac, passthrough, lenovo, usb, docking station, dock
last_updated: January 20, 2020
toc: true
folder: docs
---

### Determine host MAC address

```bash
/sbin/ifconfig eth0 | /bin/egrep "ether.* txqueuelen.* \(Ethernet\)" | /usr/bin/awk -F " " '{print $2}'
```

### Open NetworkManager connection editor

![nwman_1](images/docs/macaddres_passthrough/nwman_1.png)

### Edit the second network connection

![nwman_2](images/docs/macaddres_passthrough/nwman_2.png)

Select Device eth1, enter the determined MAC address into "Cloned MAC address", press save and in the authentication dialogue type in your user password.

![nwman_3](images/docs/macaddres_passthrough/nwman_3.png)

Now you are ready to use the network connected to your USB-C dock.
