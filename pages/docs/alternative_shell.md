---
title: alternative shell
permalink: shell.html
sidebar: default_sidebar
tags: [docs]
keywords: shell, bash, fish, zsh
last_updated: Feburary 8, 2022
toc: true
folder: docs
---

## How to change default shell

The standard shell set for all users is /bin/bash and this is prepared by the
Ubuntu Operations team for best experience with additional settings for proxies
or additional environment variables.

## Change the shell yourself

If you want to have a quick solution that does not impact behavior on "remote" systems
you can easily just add a simple line to your `~/.bashrc` that forks another shell:

```bash
# this enables zsh and prevents forking again if zsh is configured to source your
# ~/.bashrc --> it checks if ZSH_VERSION is not set and then forks runs the zsh.
if [ -z "$ZSH_VERSION" ]; then exec /usr/bin/zsh; fi
```

```bash
# this enables fish
exec /usr/bin/fish
# there is no if;then like with zsh possible as fish syntax does not understand
# then and fi.
```

## Have it changed within ldap infrastructure

You alo have the possibility to change the default shell to zsh on *all* machines at once.
This must be handeled by the Ubuntu operations support staff but then you are defaulting
to the zsh everywhere. This might produce issues when logging into a system that uses the
same ldap infrastructure but no zsh is installed. Therefore you should be really sure that
all machines that you are using are either Ubuntu RD devices or you need to make sure zsh
is always installed.

Currently only zsh is supported as only zsh is installed on every RD Ubuntu device (besides
/bin/sh and /bin/bash).

To request this change you can open a "generic service request".
[Link](./requests.html) to requests how-to page. (Click "Other")

Text for ticket

```text
As I am more used to the zsh shell I prefer to have my user updated to zsh within the ldap db.
Please change the default shell of my user to /usr/bin/zsh

Please apply to my user: <userid>

Thank you
```
