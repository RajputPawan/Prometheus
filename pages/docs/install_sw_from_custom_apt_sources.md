---
title: Install software from custom apt sources
permalink: install_sw_from_custom_apt_sources.html
sidebar: default_sidebar
tags: [docs]
keywords: apt
last_updated: October 26, 2023
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
Copy below lines, paste them to a open terminal session and hit enter.


```bash
mkdir -p ~/apt/custom-sources.list.d/ ~/apt/sources.list.d/
cat << EOF >>~/apt/update.sh
#!/bin/bash
homedir=\$(realpath ~)
sourceparts="\${homedir}/apt/sources.list.d/"
http_proxy="http://127.0.0.1:3128"
https_proxy="\${http_proxy}"

## Put your custom sources.list files here: ~/apt/custom-sources.list.d/
rsync -rv --delete /etc/apt/sources.list.d/ ~/apt/sources.list.d/
rsync -rv ~/apt/custom-sources.list.d/ ~/apt/sources.list.d/

sudo -E http_proxy="\${http_proxy}" https_proxy="\${https_proxy}" apt-get update -o Dir::Etc::SourceParts="\${sourceparts}"
sudo -E http_proxy="\${http_proxy}" https_proxy="\${https_proxy}" apt-get dist-upgrade -o Dir::Etc::SourceParts="\${sourceparts}"
echo
echo "To install a package run:"
echo "-------------------------"
echo
echo "sudo -E http_proxy=\${http_proxy} https_proxy=\${https_proxy} apt-get install -o Dir::Etc::SourceParts=\${sourceparts} <packagename>"
echo
EOF
chmod +x ~/apt/update.sh
```

This will create a script file `~/apt/update.sh`.

Now you can easily add your own sources to `~/apt/custom-sources.lists.d/`.

Running the `~/apt/update.sh` script now pulls the external sources and you can install your custom sofware.

## Speedup Upgrades when working from home

The above solution also helps if you want to install or upgrade ubuntu standard software when working at home. You can setup your custom source-parts directory pointing to archive.ubuntu.com, disable VPN and do apt update with the new source-parts dir.
