---
title: Install software from custom apt sources
permalink: install_sw_from_custom_apt_sources.html
sidebar: default_sidebar
tags: [docs]
keywords: apt
last_updated: January 13, 2021
toc: true
folder: docs
---

## Why not just put .list file into sources.list.d?

If you have sudo permissions for your Ubuntu systems you might have already realized that the config management saltstack replaces everything inside `/etc/apt/sources.list.d/` if you change it.

We need this behaviour to ensure software-upgrades apply even if no user is logged in and no local proxy forwarder is running. If you add external sources - like PPAs - unattended upgrades would fail if proxy is not working.

Knowing about this necessity you can easily work around this by doing a apt update with a different source-parts directory specified.

`sudo apt update -o Dir::Etc::sourceparts="~/apt/sources.list.d/"` uses the folder apt/sources.list.d inside your home-directory.

To have a properly working apt you need to make sure you have a fully working source-parts directory:

## Prepare your environment

```bash
mkdir -p ~/apt/custom-sources.lists.d/ ~/apt/sources.lists.d/
cat <<EOF >>~/apt/apt-update.sh
#!/bin/bash
sudo apt update -o Dir::Etc::sourceparts="~/apt/sources.list.d/
EOF
chmod +x ~/apt/apt-update.sh

## Put your custom sources.list files here: ~/apt/custom-sources.lists.d/
rsync -rv --delete /etc/apt/sources.list.d/ ~/apt/sources.lists.d/
rsync -rv ~/apt/custom-sources.lists.d/ ~/apt/sources.lists.d/
```

Now you can easily add your own sources to `~/apt/custom-sources.lists.d/` and run the last two commands to setup your personal sourceparts directory.

Running the `~/apt/apt-update.sh` script pulls the external sources and you can install your custom sofware.

## Speedup Upgrades when working from home

The above solution also helps if you want to install or upgrade ubuntu standard software when working at home. You can setup your custom source-parts directory pointing to archive.ubuntu.com, disable VPN and do apt update with the new source-parts dir.
