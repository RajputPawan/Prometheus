---
title: Nvidia drivers and Cuda Setup
permalink: nvidia.html
sidebar: default_sidebar
tags: [docs]
keywords: [nvidia, cuda, driver]
last_updated: Frabruary 7, 2022
toc: true
folder: docs
---

## Nvidia driver setup

In the default setup nvidia drivers and cuda are pre-configured on all machines that have a nvidia graphics card. There are different setups for "current version" for multiple projects, as drivers and cuda versions often need to be aligned within project teams.

Nevertheless there is an option to opt-out nvidia settings on your machine. So if you want to manage nvidia-drivers and cuda yourself, if you for example need a newer verstion, you can request by a ticket to exclude your system(s) from centrally managed nvidia setup. A precondition to managing your nvidia setup yourself is having sudo permissions. [more information...](./local_admin_rights.html)

## If you opt-out

If you opt-out for nvidia driver management, you should know that IT service won't be able to help you if your display setup, your system sleep (suspend) or something else with powermanagement breaks.

In addition you should be aware that you then have the full responsibility to have your driver patched if there is a security vulnerability with your currently installed version. This is something you should already be aware of as you must have agreed to sudo rules before you can actually handle drivers yourself.
