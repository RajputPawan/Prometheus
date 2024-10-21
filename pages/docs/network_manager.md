---
title: network Manager
permalink: network_manager.html
sidebar: default_sidebar
tags: [docs]
keywords: NetworkManager, network, NM, docker
last_updated: Aug 09, 2024
toc: true
folder: docs
---

# NetworkManager

## Unmanage interfaces from NM

1. open the file ```/etc/NetworkManager/conf.d/unmanaged-devices.conf``` in a Editor (like vim, nano, e.g.)
2. add the interface to the line ```unmanaged-devices=``` (comma separated)

required prefixes:
1. ```interface-name:<iface>``` (if <iface> is a iface name like docker0)
2. ```mac:<mac address>``` (mac address in format AB:CD:...)


<code style="color : Red">ATTENTION: DO NOT create a new file for unmanaged-devices, NetworkManager will only respect one file with defined unmanaged-devices key.</code>



## Contact

If any further questions, contact Ubuntu Operations via Teams chat, Teams group or [ubuntu-operations@mercedes-benz.com](mailto:ubuntu-operations@mercedes-benz.com)
or open a [SNOW ticket](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/incident.html)

