---
title: x2go
permalink: x2go.html
sidebar: default_sidebar
tags: [docs]
keywords: remote_access
last_updated: March 19, 2020
toc: true
folder: docs
---

## Using x2go

x2go is a feature rich remote desktop solution available on all Daimler RD Ubuntu clients.
It consists of software components for the client and the server side. Connection is made via ssh.

## Features
* transport compression for graphics
* enhanced clipboard
* sound support
* shared folders


## How to use and configure
First make sure you can login into your target host via ssh. When connecting through AlwaysOn w/o Token you cannot use port 22 but must use 42022.

Start x2go Client via Menu or commandline: x2goclient

On the first startup x2go Client will open with an empty session window.

Fill in target host and username as in the example. We recommend not to start a full blown desktop session but just a terminal window (e.g. /usr/bin/xterm).

If you want to use a full remote desktop: GNOME as a session manager does not work currently. Choose KDE or XFCE.



![x2go_session_tab1](images/docs/x2go/x2go_session_tab1.png)

On the second tab settings for transport compression can be configured. Here using the defaults is a good starting point.

![x2go_session_tab2](images/docs/x2go/x2go_session_tab2.png)

Once a session has been configured it is displayed in the main window and can be started by clicking on it.

![x2go_main_window](images/docs/x2go/x2go_main_window.png)


