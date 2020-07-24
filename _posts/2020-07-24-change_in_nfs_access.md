---
title:  "Change in NFS access"
published: true
permalink: 2020-07-24-change_in_nfs_access.html
summary: "Due to security requirements there will be a change in NFS access."
tags: [news]
---

Due to security requirements there will be a change in NFS access in the next few days.
If you encounter access problems on your network home or shares, especially via VPN, please connect with a filemanager, e.g. nautilus.

For example to connect to `/home/myuser`:
- ensure that you have a valid Kerberos ticket (use `kinit`)
- open `nautilus`
- on the left bar select `+ Other locations`
- as server address use `smb://dfshks.rd.corpintra.net/dfsroot/home/myuser`

The same works for shares (`/share`) or projects (`/proj`).

{% include links.html %}
