---
title: Guacamole
permalink: guacamole.html
sidebar: default_sidebar
tags: [docs]
keywords: guacamole, default desktop
last_updated: Aug 09, 2024
toc: true
folder: docs
---

# Remote Desktop Portal / Guacamole

## Ordering

### Available for

1. requested FPP VM's (see [FPP](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/fpp.html))
2. non FPP VM's
3. Workstations

### How to order

- Ensure that, in IT-Shop, you are named as the owner of the device you want to have access to.
- File a [Individual Service Request](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/inquiry-help.html)
- or for already existing Hosts, request via email [ubuntu-operations@mercedes-benz.com](mailto:ubuntu-operations@mercedes-benz.com)

IMPORTANT: Don't forget to name the hostname and what you want to have!


## Login to RDP / Guacamole

You can login to our Remote Desktop Portal under [https://mb4.me/uordp](https://mb4.me/uordp) with your AD account.

![guacamole](images/docs/guacamole/1.png)
(Image 1)

After login, you will see a list of hosts/connections you can use to access the host remotely.
 
![guacamole](images/docs/guacamole/2.png)
(Image 2)


## Guacamole Sidebar

Usable while connected to remote host.
```ctrl+alt+shift```

1. Required for copy&paste text to the remote host.
2. Usable for copy&paste text from remote host to the local host.


## Copy&Paste

VM -> local host:
1. Simply by using copy via right-click context menu, or ctrl+c/z.
2. Text which is copied into clipboard on the remote host, will also appears in the guacamole sidebar. 

local host -> VM:
1. Open the guacamole sidebar with ctrl + left-alt + shift (Image 3)
2. Copy the text into the "clipboard" text field. (Image 3)
3. Now the text is available in the VM's clipboard and can be paste via right-click context or ctrl+v.


![guacamole](images/docs/guacamole/3.png)
(Image 3)


## File Transfer

File Transfer via Guacamole: Currently not implemented.


### Copy file or folder via scp

```scp [-R] <username>@<FQDN>:<remote source path> <local target path>```

or

```scp [-R] <local source path> <username>@<FQDN>:<remote target path>```

-R = Recursive


### Mount remote path to local path (or remote if used on the remote host)

```sshfs <username>@<FQDN>:<remote directory> <local directory>```



### Using GNOME Files

1. Go to "other locations" (Image 5)
2. Enter ```sftp://<FQDN>/``` (Image 5)
3. Provide your Login username/password if you get asked for it (Image 6)

![guacamole](images/docs/guacamole/5.png)
(Image 5)

![guacamole](images/docs/guacamole/6.png)
(Image 6)

### Using KDE Dolphin

1. Open Dolphin and click in the address bar (Image 7)
![guacamole](images/docs/guacamole/7.png)
(Image 7)


2. Enter ```sftp://<FQDN>/``` and press Enter (Image 8)
![guacamole](images/docs/guacamole/8.png)
(Image 8)


3. If shown up, accept the warning for unkown host key (Image 9)
![guacamole](images/docs/guacamole/9.png)
(Image 9)


### Placeholders:

```<username> = AD account, as you used for login.```

```<FQDN> = full hostname like "cmtcdeu12345678.rd.corpintra.net"```



## Default Desktop Environment

The default Desktop Environment is GNOME.

Since there is no way to define another one via the used Remote Desktop tools, you must define it manually if you want another one.


Log in to the remote host via ssh (or if its a workstation, via terminal) and use the following commands to change the default:

```update-alternatives --config x-session-manager```

You will be asked which Desktop should be the new default.



## Different Resolutions

We provide from beginning for every host, 2 different display resolutions.

```<hostname>_HD: 1280x720, 16bit color depth```

```<hostname>_FHD: 1920x1080, 24bit color depth```

if you need any special settings related to resolution/color depth, you can ask us.

![guacamole](images/docs/guacamole/2.png)



## Multiple Remote Connections

If you have more then one remote hosts assigned to your account, you can also show multiple of them in one window.

1. Go within a open session to the Guaccamole sidebar with ctrl+alt+shift.
2. Open the menu via the down arrow.
3. Select the reote session which should shown in the same window.

![guacamole](images/docs/guacamole/4.png)
(Image 4)


## Contact

If any further questions, contact Ubuntu Operations via Teams chat, Teams group or [ubuntu-operations@mercedes-benz.com](mailto:ubuntu-operations@mercedes-benz.com)
or open a [SNOW ticket](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/incident.html)

