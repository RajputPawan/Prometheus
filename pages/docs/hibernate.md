---
title: Hibernate
permalink: hibernate.html
sidebar: default_sidebar
tags: [docs]
keywords: hibernate, disk encryption, encryption, swap, small swap
last_updated: Feburary 8, 2022
toc: false
folder: docs
---

## How to enable hibernate on Ubuntu laptop

This howto was born as there persists a problem within Ubuntu standard deployments that causes very small
swap partitions and therefore hibernation does not work properly. As users do not have access to the BIOS
admin passphrase they cannot boot from a rescue system to change partitioning and therefore the only
workaround is to have a swapfile on the encrypted disk.

Tested on Dell Precision 7550 and 5560 with Ubuntu 20.04

### create 32GB /swapfile, activate it and disable standard swap partition

```bash
sudo fallocate -l 32G /swapfile
sudo chown 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapoff /dev/mapper/ubuntu-swap_1
```

### add /swapfile to /etc/fstab and comment out previous swap partition

```bash
#/dev/mapper/ubuntu-swap_1 none            swap    sw              0       0
/swapfile   none    swap     sw      0       0
```

### find out swapfile UUID

```bash
$ sudo findmnt -no UUID -T /swapfile
05742006-29c8-4a14-acd1-51eaca0ba05e
```

### find out physical offset of the swapfile

```bash
$ sudo filefrag -v /swapfile | grep " 0:" | awk '{print $4}' | cut -d. -f1
87648256
```

### edit /etc/default/grub and add "resume=UUID=<UUID-from-step-3> resume_offset=<resume-offset-from-step-4" to GRUB_CMDLINE_LINUX_DEFAULT

Example (**DO NOT USE those numbers, your system has different values!!!**):

```bash
GRUB_CMDLINE_LINUX_DEFAULT=" splash mem_sleep_default=deep resume=UUID=05742006-29c8-4a14-acd1-51eaca0ba05e resume_offset=87648256"
```

### update grub

```bash
sudo update-grub
```

### edit /etc/initramfs-tools/conf.d/resume and replace the content with "RESUME=UUID=<UUID-from-step-3> resume_offset=<resume-offset-from-step-4"

Example (**DO NOT USE those numbers, your system has different values!!!**):

```bash
RESUME=UUID=05742006-29c8-4a14-acd1-51eaca0ba05e resume_offset=87648256
```

### udpate initramfs (warning message can be ignored)

```bash
$ sudo update-initramfs -c -k all
W: initramfs-tools configuration sets RESUME=UUID=05742006-29c8-4a14-acd1-51eaca0ba05e
W: but no matching swap device is available
```

### enable hibernate in desktop environment

```bash
$ sudo tee /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla >/dev/null << EOF
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

### manually hibernate or suspend-then-hibernate

```bash
sudo systemctl hibernate
sudo systemctl suspend-then-hibernate
```

There are also some additional settings for hibernate and sleep in systemd that can be adjusted in `/etc/systemd/sleep.conf`.

### Credits

Thank you for providing this information / how-to, Alexander Kerner <alexander.kerner@daimler.com>
