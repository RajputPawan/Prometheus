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

