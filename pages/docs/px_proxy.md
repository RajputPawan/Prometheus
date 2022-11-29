---
title: px-proxy
permalink: px_proxy.html
sidebar: default_sidebar
tags: [docs]
keywords: proxy
last_updated: May 10, 2021
toc: true
folder: docs
---

## Preamble

>`px-proxy` is only available for Ubuntu 18.04 LTS or higher and _NOT_ for other Ubuntu distributions. Users with Ubuntu 16.04 LTS should upgrade to Ubuntu 18.04 LTS.

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

## Known Issues

Please check the following prerequisites If internet access via px-proxy does not work for you:

### Valid Kerberos TGT needed

You can check either via `krb5-auth-dialog` (Icon in the system tray)
Or type `klist` on the terminal. A valid ticket looks like this (the expiry date is marked in red here):

```bash
Ticket cache: FILE:/tmp/krb5cc_74485
Default principal: hulandg@EMEA.CORPDIR.NET

Valid starting       Expires              Service principal
06/18/2020 08:00:09  06/18/2020 18:00:09  krbtgt/EMEA.CORPDIR.NET@EMEA.CORPDIR.NET
        renew until 06/25/2020 08:00:09
```

If there is no ticket or the ticket has expired: use the krb5-auth-dialog to renew it or type kinit on the terminal.

### Internet clearance for external users (FAK)

Make sure that internet access has been granted in ITShop
The service `DL INTERNETFREISCHALTUNG FAK IN RD (QEV111AFLIDX)` needs to be activated.

## Configure px-proxy for automated jobs

Sometimes it is necessary to run the local proxy without active Kerberos tickets. For example if a system does automated tasks when nobody is logged in. Therefore px-proxy has the possibility to store the password in the gnome-keyring.
As gnome-keyring can also be used on non-graphical used systems (gnome-keyring-daemon) this is much more secure than storing passwords cntlm like in cleartext config files.

### Requesting a pool-id for automation proxy access

> Please do never save your personal user accounts password for automation-jobs. Especially never store your password on a shared system. Request a pool-id for this purpose:

You can request a PoolID in [EMT](https://iam-tools.iam.corpintra.net/emt)

When you received your Pool-ID name and credentials you can request Proxy-Access for this user at [Information-Office](mailto:information-office@mercedes-benz.com).

### Store password in keyring

```bash
banholp@cmtcleu60250979:~$ px-proxy --set-password 'EMEA\pid131as11'
Password:
Password stored in default keyring service Px and user EMEA\pid131as11
```

### Create custom config

To create your custom config you can run `px-proxy` without any additional options and use the gui to save the config into a .ini file.

![px gui](images/docs/px_proxy/px-proxy_115.png)

Don't forget to set threads to a high number as this massively impacts on internet performance.

### Enable custom px-proxy.service to use config file

Create a service file in directory `~/.config/systemd/user/px-proxy.service`

Add path to your config file in the service file `--config=/lhome/$USER/.config/px-proxy/px-proxy.ini`

```bash
systemctl --user stop px-proxy.service
systemctl --user disable px-proxy.service
systemctl --user daemon-reload
systemctl --user enable px-proxy.service
systemctl --user start px-proxy.service
```

After that a symlink from the default service file to your service file is generated:

![symlink_px](images/docs/px_proxy/symlink_px-proxy.png)

### FAQ

<div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">I still want to use CNTLM. What about that?</a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse noCrossRef">
            <div class="panel-body">
                CNTLM stores the proxy user's password hash in /etc/cntlm.conf. This is insecure and violates the company's security guidelines. <b>NTLM-Hashes are not secure!</b>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">I do not want to use proxy.pac, what can I do?</a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse noCrossRef">
            <div class="panel-body">
                <b>This is not a supported configuration.</b> Nevertheless you can configure px-proxy to use a fixed upstream proxy. Make sure it supports Kerberos authentication. Copy /usr/lib/systemd/user/px-proxy.service to ~/.config/systemd/user/. Replace $ARGS with your prefered config parameters. (e.g. --threads=100 --proxy=...).
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">I've been using tinyproxy for proxy routing. Do I still need it?</a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse noCrossRef">
            <div class="panel-body">
                No.
            </div>
        </div>
    </div>
</div>
