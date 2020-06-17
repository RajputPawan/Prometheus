---
title: PX-Proxy
permalink: px_proxy.html
sidebar: default_sidebar
tags: [docs]
keywords: proxy
last_updated: June 15, 2020
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

## Configure PX Proxy for automated jobs

Sometimes it is necessary to run the local proxy without active Kerberos tickets. For example if a system does automated tasks when nobody is logged in. Therefore px-proxy has the possibility to store the password in the gnome-keyring.
As gnome-keyring can also be used on non-graphical used systems (gnome-keyring-daemon) this is much more secure than storing passwords cntlm like in cleartext config files.

### Requesting a pool-id for automation proxy access

> Please do never save your personal user accounts password for automation-jobs. Especially never store your password on a shared system. Request a pool-id for this purpose:

You can request a PoolID in [EMT](https://intra-wiwtools.e.corpintra.net/emt/create?t=poolId&lang=en)

When you received your Pool-ID name and credentials you can request Proxy-Access for this user at [IT-Security-RD](mailto:mbox-059-iso-office-rd@daimler.com).

### Store password in keyring

```bash
banholp@cmtcleu60250979:~$ px-proxy --set-password 'EMEA\banholp'
Password: 
Password stored in default keyring service Px and user EMEA\banholp
```

### Create custom config

To create your custom config you can run `px-proxy` without any additional options and use the gui to save the config into a .ini file.

![px gui](images/docs/px_proxy/px-proxy_115.png)

Don't forget to set threads to a high number as this massively impacts on internet performance.


