---
title: Zscaler issue tracker
permalink: zscaler_issues.html
sidebar: default_sidebar
tags: [docs]
keywords: vpn, zscaler
last_updated: February 1, 2024
toc: true
folder: docs
---

## (inofficial) Zscaler issue tracker

This is an effort to collect the current status and error reports regarding
Zscaler Private Access from the Linux users' view.

Reports and discussion usually happen in `ZPA Linux client BETA` Teams Chat.

## Applications / Connections

### NTP

NTP Synchronisation with `time1.rd.corpintra.net` stopped working (again).
UDP Port 123, bidirectional.

```
systemd-timesyncd[...]: Timed out waiting for reply from 100.64.1.36:123 (time1.rd.corpintra.net).
```

#### Timeline

* 2023-12-06: reported
* 2024-01-31: reported again

### VNC

TCP Port Range 5900 - 5999.

#### Timeline

* 2023-11-17: reported




### MTTF Dashboards

http://smtcagd00321.rd.corpintra.net:5602/

#### Timeline

* 2023-11-xx: requested to be opened not working since
* still not working, works when tunneling through ssh on workstation which is in DCN but this is veeery ugly.
