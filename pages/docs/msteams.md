---
title: Microsoft Teams as progressive web app (PWA)
permalink: msteams.html
sidebar: default_sidebar
tags: [docs]
keywords: Microsoft, MS Teams, PWA, edge, google-chrome
last_updated: March 23, 2023
toc: false
folder: docs
---

## Microsoft Teams

Microsoft discontinued the development of the Linux app "teams" (aka fat client)
and announced its replacement as Microsoft Teams Progressive Web Application
(PWA) for Linux customers, see the following link.

Microsoft Teams announcement: [https://go.microsoft.com/fwlink/?linkid=2226702&clcid=0x409&culture=en-us&country=us](https://go.microsoft.com/fwlink/?linkid=2226702&clcid=0x409&culture=en-us&country=us)

The PWA experience is available for both `Edge` and `Chrome` browsers running on
Linux.

The PWA offers access to more capabilities, including custom backgrounds,
gallery view, reactions, the raise-a-hand feature in meetings, as well as large
gallery and Together mode views. The PWA also provides desktop-like app
features, such as system notifications for chat and channel, a dock icon with
respective controls, application auto-start, and easy access to system app
permissions.

### Setup

Start the edge browser from the Application Launcher, or via commandline

```bash
 microsoft-edge-stable
```

Alternatively start the google-chrome browser from the Application Launcher, or via commandline

```bash
 google-chrome
```

The MB-login page appears

![msteams_1](images/docs/msteams/msteams_1.jpeg)

enter your MB userid

click Next

enter your password

click Log on

in the automatically provided second browser tab authenticate yourself via `PingID`

open a new tab (+ sign in the top line)

enter in the URL field:

`https://teams.microsoft.com`

![msteams_3](images/docs/msteams/msteams_3.jpeg)

The Microsoft Sign in page appears

![msteams_2](images/docs/msteams/msteams_2.jpeg)

enter your userid you are using for teams

click Next

enter your password / authenticatee yourself via the `Microsoft Authenticator`


### Once you've started the browser for the first time

Once you've started the edge/google-chrome browser for the first time, an entry gets created
in the Applications Launcher:

```bash
 Microsoft Teams (PWA - Google Chrome)
```

or

```bash
 Microsoft Teams (PWA - MS Edge)
```

respectively.


### Background info

The Microsoft official download page no longer offers the fat client for Linux, 
but points to the PWA: [https://www.microsoft.com/en-us/microsoft-teams/download-app](https://www.microsoft.com/en-us/microsoft-teams/download-app)

