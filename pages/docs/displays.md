---
title: Displays / Resolution
permalink: displays.html
sidebar: default_sidebar
tags: [docs]
keywords: display, resolution, login
last_updated: Feb 12, 2021
toc: true
folder: docs
---

## Resolution at Login Screen

Since GDM3 is used, the resolution and the primary display is not automatically configurable.

You can setup your display configuration, after login, via Gnome Display Settings and tell GDM to use it.


After configuration your displays with the GNOME display settings:

1. Open a Terminal and gain root rights.

2. Copy the file "~/.config/monitors.xml" (from within your profile directory)

to "/var/lib/gdm/.config/monitors.xml"


If its working, the Login screen will then use the configuration stored in monitors.xml.

If you ever change the configuration, you need to copy the file again.

This workaround is not working reliable and especially while using a non compatible docking station, with your notebook, it will maybe not work.

