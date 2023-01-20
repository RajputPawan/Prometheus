---
title: Ubuntu 22 (Jammy) Installation
permalink: install-jammy.html
sidebar: default_sidebar
tags: [docs]
keywords: jammy
last_updated: November 03, 2022
toc: true
folder: docs
---


## General

Our Ubuntu Jammy uses a complete different installer than our Ubuntu Focal.

Benefits:
* No user interaction needed
* Installation on Virtual Machines with NAT possible
* Remote support if anything goes wrong


### Network Detection

The installer will determine automatically the correct network device MAC address if you are connected to Mercedes Benz internal network and your CI has multiple network devices.


![install-jammy](images/docs/install-jammy/install-jammy1.png)
(Image 1)

Installation is still not possible if you are using a wrong USB/LAN adapter or docking station.

In such cases, the installer will run into a endless loop, and you can request support from us to temporarily override the MAC address. (working IP address via DHCP still required)

Also if you don't get a working IP address via DHCP.

![install-jammy](images/docs/install-jammy/install-jammy2.png)
(Image 2)

On Virtual Machines which are connected via NAT, the MAC address from the first network device will be used.

![install-jammy](images/docs/install-jammy/install-jammy3.png)
(Image 3)


### Hard drive detection

The hard drive selection for installation will use following rules
1. Search for old installation and use this hard drive (Image 1,2 & 3)
2. Try to use the first hard drive of type NVME > SSD > HDD
3. If the installer could not found a hard drive, he will crash the installation and print the IP address. Please contact the Ubuntu support and provide the host name and IP for support. (Image 4)
4. If the installer find a hard drive, he will print information about found and selected device and wait for ~60 seconds. Please verify the selected device and if its the wrong device, power off the machine immediately to prevent data loss. (Image 5)

![install-jammy](images/docs/install-jammy/install-jammy4.png)
(Image 4)

![install-jammy](images/docs/install-jammy/install-jammy5.png)
(Image 5)


## VM Installation

Following informations are only tested and working for Ubuntu VMs on Ubuntu Hosts.

We can not provide remotely support for VMs which are connected via NAT.


### Firmware

The VM requires UEFI as Firmware Type.

![install-jammy](images/docs/install-jammy/install-jammy6.png)



### Network

It is possible to install Ubuntu Jammy on a VM while the host is in home office.

The Host still needs to be connected to Mercedes Benz network. (e.g. via VPN)

While for onsite installation, Bridged and NAT network mode will work, installation in home office or if the host is connected via wifi, the VM needs NAT network.

![install-jammy](images/docs/install-jammy/install-jammy7.png)


If Bridged mode is used, the MAC address (can be found in network informations, IT-Shop) needs to be set in the VM settings.



![install-jammy](images/docs/install-jammy/install-jammy8.png)

![install-jammy](images/docs/install-jammy/install-jammy9.png)



## Ubuntu Support

Reachable via Mercedes Benz Teams or ticket system

[Incident How To](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/incident.html)
