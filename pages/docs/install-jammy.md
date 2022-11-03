---
title: Ubuntu Jammy Installation
permalink: install-jammy.html
sidebar: default_sidebar
tags: [docs]
keywords: jammy
last_updated: November 03, 2022
toc: true
folder: docs
---


Ubuntu Jammy uses a complete different installer than Ubuntu Focal.
Benefits:
	- No user interaction needed
	- Installation on Virtual Machines with NAT possible
	- Remote support if anything goes wrong

The installer will determine automatically the correct network device MAC address if you are connected to Mercedes Benz internal network and your CI has multiple network devices.

![install-jammy](images/docs/install-jammy/install-jammy1.png)
(Installation example 1)

Installation is still not possible if you are using a wrong USB/LAN adapter or docking station.
In such cases, the installer will run into a endless loop, and you can request support from us to temporarily override the MAC address. (working IP address via DHCP still required)
Also if you don't get a working IP address via DHCP.

![install-jammy](images/docs/install-jammy/install-jammy2.png)
(Installation example 2)

On Virtual Machines which are connected via NAT, the MAC address from the first network device will be used.

![install-jammy](images/docs/install-jammy/install-jammy3.png)
(Installation example 3)


The hard drive selection for installation will use following rules
	1. Search for old installation and use this hard drive (Image 1,2 & 3)
	2. Try to use the first hard drive of type NVME > SSD > HDD
		- If the installer could not found a hard drive, he will crash the installation and print the IP address. Please contact the Ubuntu support and provide the host name and IP for support. (Image 4)
		- If the installer find a hard drive, he will print information about found and selected device and wait for ~60 seconds. Please verify the selected device and if its the wrong device, power off the machine immediately to prevent data loss. (Image 5)

![install-jammy](images/docs/install-jammy/install-jammy4.png)
(Installation example 4)

![install-jammy](images/docs/install-jammy/install-jammy5.png)
(Installation example 5)
