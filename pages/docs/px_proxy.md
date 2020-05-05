---
title: PX-Proxy
permalink: px_proxy.html
sidebar: default_sidebar
tags: [docs]
keywords: proxy
last_updated: May 5, 2020
toc: true
folder: docs
---

## Prerequisites

For the new proxy-forwarder to work properly a valid kerberos ticket is required. Normally the ticket will be renewed on every login/unlocking when connected to corporate network or VPN. If this fails renew your credentials yourself by executing the following on the command line:

```bash
kinit
```

Or use the auth dialog available in the system tray.

## Configuration

### Install

Installation is currently only necessary on Sunnyvale-Clients. German systems are configured automatically.

```bash
sudo apt-get install px-proxy krb5-auth-dialog
```

### Configure

- Stop, disable and mask CNTLM

```bash
sudo systemctl stop cntlm.service
sudo systemctl disable cntlm.service
sudo systemctl mask cntlm.service
```

**Sunnyvale:**

```bash
sudo bash -c "echo 'ARGS=\"--pac=http://browsercfg.rd.corpintra.net:8899/624-kerberos/proxy.pac\"' > /etc/default/px-proxy"
```

## Enable for your user

```bash
systemctl --user enable px-proxy
systemctl --user start px-proxy
```
