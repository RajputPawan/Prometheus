---
title: Full Partition
permalink: full-partition.html
sidebar: default_sidebar
tags: [docs]
keywords: partition
last_updated: December 5, 2022
toc: true
folder: docs
---


### About




## Boot Partition

If your boot partition is full, you can check with (via terminal)
`df -h /boot`
if your boot partiton is of size ~700MB in this case we suggest a reinstallation to fix that issue permanently.
We can solve it only temporarily because the old 700MB partition size is to small for normal operations.

Example:

`df -h /boot`

Output:

Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p2  704M  498M  155M  77% /boot



## Root Partition

If your root partition is affected, you can check recursively with (via terminal)
`du -xhd1 <path>`		(beginning with <path> = /)
or
`du -xsh <path>`		(beginning with <path> = /*)
which directory consumes the most or nearly all space.

You can also sort the results where the highest amount is at the bottom
`du -xhd1 <path> | sort -h`


Example: (maybe the most common case where docker containers/cache using the most space)

`du -xhd1 / | sort -h`

Output:
...
3.2G	/lib
48G		/var
81G		/					(the last line can be ignored)


`du -xhd1 /var | sort -h`

Output:
...
13G	/var/log
36G	/var/lib
48G	/var/					(the last line can be ignored)


`du -xhd1 /var/lib | sort -h`

Output:
...
131M	/var/lib/apt
35G	/var/lib/containers
36G	/var/lib				(the last line can be ignored)



### Ubuntu Support

Reachable via Mercedes Benz Teams or ticket system

[Incident How To](https://pages.git.i.mercedes-benz.com/ubunturd/ubuntudoc/incident.html)

