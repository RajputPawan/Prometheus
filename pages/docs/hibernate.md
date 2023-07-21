---
title: Hibernate
permalink: hibernate.html
sidebar: default_sidebar
tags: [docs]
keywords: hibernate, disk encryption, encryption, swap, small swap
last_updated: July 21, 2023
toc: false
folder: docs
---

## How to enable hibernate on Ubuntu laptop

Ubuntu client deployments have very small swap partitions not suitable
for hibernation (ACPI S4).  Since all disk space is already assigned
to logical volumes, the swap area can not be extended.  The workaround
is to have a swapfile on the encrypted disk. This requires a slight
modification to the boot configuration which is described below.

_This document has been updated because it had errors. Specifically, the
UUID of the swapfile was used instead of the file system it resides on,
preventing this guide from working._

Tested on `HP ZBook Fury 15.6 inch G8` with Ubuntu 22.04.

All commands and edits are assumed to be run with root privileges,
either through `sudo` or a root shell.

### Create /swapfile and disable old swap

Allocate and format a swap file:

```bash
fallocate -l 32G /swapfile
chmod 000 /swapfile
mkswap -L swapfile /swapfile
```

Then, disable old swap volume(s):

```bash
swapoff -av
```

### Edit /etc/fstab and activate /swapfile

Comment out old swap line and add a new line for /swapfile:

/etc/fstab:
```
#[...]    none swap sw 0 0
/swapfile none swap sw 0 0
```

Then, Activate the swap file:

```bash
swapon -av
```

### Get filesystem UUID

```bash
findmnt / | awk '{print $2}' | xargs blkid | cut -d'"' -f2
```

This number will be referenced as `$UUID` from here on.

### Get physical offset of the swapfile on the root filesystem

```bash
filefrag -v /swapfile | head -n4 | tail -n1 | awk '{print $4}' | cut -d. -f1
```

This number will be referenced as `$OFFSET` from here on.

### Edit /etc/default/grub and update grub config

Add `resume=UUID=$UUID resume_offset=$OFFSET` to the variable string
`GRUB_CMDLINE_LINUX_DEFAULT` in /etc/default/grub.

(Replace the placeholders with your values.)

Then, run:

```bash
update-grub
```

### Edit /etc/initramfs-tools/conf.d/resume and update initramfs


```bash
RESUME=UUID=$UUID resume_offset=$OFFSET
```

(Replace the placeholders with your values.)

Update initramfs like so:

```bash
update-initramfs -u -k all
```

Warnings can be ignored.

### Enable hibernate in desktop environment

(TODO: Check if this section still applies 1:1.)

```bash
$ tee /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla >/dev/null << EOF
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.handle-hibernate-key;org.freedesktop.login1;org.freedesktop.login1.hibernate-multiple-sessions;org.freedesktop.login1.hibernate-ignore-inhibit
ResultActive=yes
EOF
```

### Manually hibernate or suspend-then-hibernate

```bash
systemctl hibernate
systemctl suspend-then-hibernate
```

Also try the hibernate menu of your desktop after a reboot.

There are also some additional settings for hibernate and sleep in
systemd that can be adjusted in `/etc/systemd/sleep.conf`.

### Credits

Thank you for providing the originial how-to, Alexander Kerner <alexander.kerner@mercedes-benz.com>.
Updated by <selim.arslanbek@mercedes-benz.com>.
