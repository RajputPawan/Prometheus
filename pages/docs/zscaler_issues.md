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

## Service Now

[The official way to report an incident to the Zscaler team is through SNOW.](
https://servicenow.i.mercedes-benz.com/esc?id=sc_cat_item&sys_id=062eec1f1b0c605093b43113dd4bcbf0&sysparm_variables=eyJjaG9vc2VfaXNzdWVfcmVsYXRlZCI6ImFwcGxpY2F0aW9uIHNlcnZpY2UiLCJ0cnlfbmV3X3VpIjoie1xyXG5cIndpZGdldFwiOlwibWItdHJ5LW5ldy11aVwiLFxyXG5cInN1YkhlYWRpbmdcIjpcIlBsZWFzZSBub3RlIHRoYXQgdGhpcyBuZXcgaW50ZXJmYWNlIGlzIGFwcGxpY2FibGUgb25seSBpZiB5b3VyIGlzc3VlIGlzIHdpdGggSVQtU2VydmljZSBvciBBcHBsaWNhdGlvbiBTZXJ2aWNlLiBJZiB5b3UgaGF2ZSBhbiBpc3N1ZSB3aXRoIHNvbWV0aGluZyBlbHNlLCBwbGVhc2Ugc2VsZWN0IHRoZSBhcHByb3ByaWF0ZSB2YWx1ZSBmcm9tIHRoZSBkcm9wZG93biBzZWxlY3Rpb24gYWJvdmUuXCIsXHJcblwidXJsXCI6XCIvZXNjP2lkPXNjX2NhdF9pdGVtJnN5c19pZD00MmFhMGViMmRiNDZmMWQwODZlZjIxZmJkMzk2MTk0ZVwiXHJcbn0iLCJyZWNlbnRfYXBwbGljYXRpb25fc2VydmljZXNfc3VnZ2VzdGlvbnMiOiJ7XHJcblwid2lkZ2V0XCI6XCJyZWNlbnQtYXBwbGljYXRpb24tc2VydmljZXMtc3VnZ2VzdGlvblwiLFxyXG5cIm1hcHBlZFZhcmlhYmxlXCI6XCJ1X3NlcnZpY2VfaW5zdGFuY2VcIixcclxuXCJ1c2VyRmllbGRcIjpcImNhbGxlcl9pZFwiXHJcbn0iLCJ1X3NlcnZpY2VfaW5zdGFuY2UiOiI2NDJkODA2NDFiMDQ5OTE4YTNkMzYyNDA2YjRiY2JhMSIsInByb2R1Y3Rpb25fb25seSI6InRydWUiLCJzZWxlY3RfdGVtcGxhdGUiOiJmN2NkMTBmMTkzOGM0MjU0ZmYwOWI5MmE3YmJhMTA5MiIsInVyZ2VuY3kiOiIzIn0%3D)

## (inofficial) Zscaler issue tracker

This is an effort to collect the current status and error reports regarding
Zscaler Private Access from the Linux users' perspective.

Reports and discussion usually happen in `ZPA Linux client BETA` Teams Chat.

## broken

Below Applications / Connections do not work.

### Nvidia targets

alfred-valet:

alfred-valet.nvidia.com works correct but it forwards to alfred.nvidia.com which does not work!

#### Timeline

* requested 2023-06: not working properly since

## working

Below Applications / Connections are working.

### MTTF Dashboards

http://smtcagd00321.rd.corpintra.net:5602/

#### Timeline

* 2023-11-xx: requested to be opened not working since
* still not working, works when tunneling through ssh on workstation which is in DCN but this is veeery ugly.
* 2024-02-12: working

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

