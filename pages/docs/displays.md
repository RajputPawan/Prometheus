---
title: ad-self-service
permalink: ad-self-service.html
sidebar: default_sidebar
tags: [docs]
keywords: active_directory
last_updated: Feb 12, 2021
toc: true
folder: docs
---

## Resolution at Login Screen

Since GDM3 is used, the resolution and the primary display is not dynamically configurable.
You can setup your display configuration, after login, via Gnome Display Settings.
That will create the file ~/.config/monitors.xml
With root rights, you can copy this file to /var/lib/gdm/.config/monitors.xml

If its working, the Login screen will then use the configuration stored in monitors.xml.
If you ever change the configuration, you need to copy the file again.

This workaround is not working reliable and especially while using a non comptible docking station with your notebook, it will maybe not work.

