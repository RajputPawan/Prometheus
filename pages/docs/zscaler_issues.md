---
title: Zscaler issue tracker
permalink: zscaler_issues.html
sidebar: default_sidebar
tags: [docs]
keywords: vpn, zscaler
last_updated: 2024-02-02
toc: true
folder: docs
---

## (inofficial) Zscaler issue tracker

This is an effort to collect the current status and error reports regarding
Zscaler Private Access from the Linux users' view.

Reports and discussion usually happen in `ZPA Linux client BETA` Teams Chat.

## broken

Below Applications / Connections do not work.

### MTTF Dashboards

http://smtcagd00321.rd.corpintra.net:5602/

#### Timeline

* 2023-11-xx: requested to be opened not working since
* still not working, works when tunneling through ssh on workstation which is in DCN but this is veeery ugly.

### Nvidia targets

alfred-valet:

alfred-valet.nvidia.com works correct but it forwards to alfred.nvidia.com which does not work!

#### Timeline

* requested 2023-06: not working properly since

## working

Below Applications / Connections are working.

### NTP

NTP Synchronisation with e.g. with `time1.rd.corpintra.net`.
UDP Port 123, bidirectional.

#### Timeline

* 2023-12-06: reported broken
* 2024-01-31: reported again
* 2024-02-02: working (again)

### VNC

TCP Port Range 5900 - 5999, e.g. to cmtcdeu68384635.rd.corpintra.net

#### Timeline

* 2023-11-17: reported
* 2024-02-02: working

