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

## Prerequisites

For the new proxy-forwarder to work properly, a valid kerberos ticket is required. Normally the ticket will be renewed on every login/unlocking when connected to corporate network or VPN. If this fails, renew your credentials yourself by executing the following on the command line:

```bash
kinit
```

Or use the auth dialog available in the system tray.

## Configuration

### Install

All systems running a Ubuntu RD image are configured automatically, configuration of the px-proxy user service is done during a GUI session startup by executing `/etc/X11/Xsession.d/97px-proxy`.

### Manual installation(legacy):

- Stop, disable and mask CNTLM(if present)

```bash
sudo systemctl stop cntlm.service
sudo systemctl disable cntlm.service
sudo systemctl mask cntlm.service
```

- Install the px-proxy package

```bash
sudo apt-get install px-proxy krb5-auth-dialog
```

- Update your system

```bash 
sudo salt-call state.highstate
```

## Service controls

```bash
systemctl --user status px-proxy
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


## Configure px proxy for PoolID (NEW VARIANT!)

### Requisites

1. sudo/root access to the related host.
2. PoolID/Password
3. Stop the running px-proxy with ```systemctl --user stop px-proxy```


### Requesting a pool-id for automation proxy access

> Please do never save your personal user accounts password for automation-jobs. Especially never store your password on a shared system. Request a pool-id for this purpose:

You can request a PoolID in [EMT](https://emt.iam.corpintra.net/emt/)

When you received your Pool-ID name and credentials you can [request
proxy access for this via UHD](
https://servicenow.i.mercedes-benz.com/esc?id=sc_cat_item&table=sc_cat_item&sys_id=74f00e051b8160502f8a3113dd4bcbce). (They route this request to the
Information Office and ISO.)

![px-proxy request](images/docs/px_proxy/px-proxy-request.png)



### Setup

Create the directory ```/opt/pxproxy``` and save following example config to ```/opt/pxproxy/px.ini```

```
[proxy]
server =
pac =
listen = 127.0.0.1
port = 3128
gateway = 1
hostonly = 1
allow = 127.0.0.0/8,172.16.0.0/12
noproxy = 127.0.0.0/8,100.64.0.0/16,172.16.0.0/12
useragent =
username = <DOMAIN\PoolID>
password = <password>
auth = NTLM

[client]
client_username =
client_auth = 
client_nosspi = 0

[settings]
workers = 2
threads = 32
idle = 30
socktimeout = 20.0
proxyreload = 60
foreground = 0
log = 0
```


1. Add the PoolID to the ```username``` key. Syntax: ```DOMAIN\PoolID``` (e.g. EMEA\PID12345)
2. Add the PoolID password to the ```password``` key. (Without quotes)
3. Run the command ```highstate.sh``` in a terminal.

After the highstate is done, which can take some time, the proxy should already be up and running.
If not, a reboot could help.

If it is working as expected, there is no further interaction required.


## Configure px-proxy for automated jobs (old/legacy variant)

Sometimes it is necessary to run a local proxy without active Kerberos tickets. For example if a system does automated tasks when nobody is logged in. Px-proxy has the possibility to store passwords in gnome-keyring.
As gnome-keyring can also be used on non-graphical used systems (gnome-keyring-daemon) this is much more secure than storing passwords cntlm like in cleartext config files.

### Requesting a pool-id for automation proxy access

> Please do never save your personal user accounts password for automation-jobs. Especially never store your password on a shared system. Request a pool-id for this purpose:

You can request a PoolID in [EMT](https://emt.iam.corpintra.net/emt/)

When you received your Pool-ID name and credentials you can [request
proxy access for this via UHD](
https://servicenow.i.mercedes-benz.com/esc?id=sc_cat_item&sys_id=062eec1f1b0c605093b43113dd4bcbf0
). (They route this request to the
Information Office and ISO.)

### Store password in your default keyring

```bash
banholp@cmtcleu60250979:~$ px-proxy --set-password 'EMEA\PID1234'
Password:
Password stored in default keyring service Px and user EMEA\PID1234
```

### Create a custom configuration for px-proxy

To create your custom config you can run `px-proxy` without any additional options and use the gui to save the config into a .ini file(see below screenshot as reference):

1) Configuration is by default stored in `~/.config/px-proxy/px-proxy.ini`  
2) Tick "**Save configuration**" before hitting the "**Start**" button  
3) Your default px-proxy pac url is located in `/etc/default/px-proxy`, for EMEA users there is one difference though, `http://browsercfg.edc.corpintra.net:8899/059/proxy.pac?location=proxy-sf0-krb` returns proxy addresses with their kerberos-auth endpoints which would fail for NTLM, you need to configure the default location instead `http://browsercfg.edc.corpintra.net:8899/059/proxy.pac`  
4) Listen address, for local-only setups use `127.0.0.1`  
5) Make sure "**NTLM**" authentication mechanism is selected  
6) Hit the "**Start**" button to write the configuration to disk  

![px gui](images/docs/px_proxy/px-proxy_115.png)

Don't forget to set threads to a high number as this massively impacts performance.  
Your configuration file should look as follows(you can create it manually as well):

```bash
$ cat ~/.config/px-proxy/px-proxy.ini 
[proxy]
pac = http://browsercfg.url.for.your.location/proxy.pac
port = 3128
listen = 127.0.0.1
allow = 172.17.*.*
gateway = 1
hostonly = 1
noproxy = 127.0.0.0/8,100.64.0.0/16,172.17.0.0/16
useragent = 
username = EMEA\PID1234
auth = NTLM

[settings]
workers = 4
threads = 5
idle = 30
socktimeout = 20
proxyreload = 60
foreground = 0
log = 1

```

### Configure your user px-proxy.service to use the new configuration file

To set up the `px-proxy` service for a specific user, follow these steps:

1) **Copy the system-wide `px-proxy.service` file to the user's systemd directory**

```bash
cp /usr/lib/systemd/user/px-proxy.service ~/.config/systemd/user/px-proxy.service
```

2) **Edit the copied service file to update its contents.**  
You can use a text editor or the cat command to view the file's contents.

```bash
[Unit]
Description=Px authenticating proxy
StartLimitIntervalSec=60s
StartLimitBurst=1

[Service]
ExecStart=/usr/bin/px-proxy --hostonly --config=/%h/.config/px-proxy/px-proxy.ini
Restart=on-failure

[Install]
WantedBy=default.target
```

Below steps are necessary when setting up, modifying, or re-enabling a systemd service to ensure it runs with the correct configuration.

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

