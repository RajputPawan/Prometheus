---
title: Automount /whome
permalink: whome.html
sidebar: default_sidebar
tags: [docs]
toc: true
folder: docs
---

## Introduction

Users coming from the standard Windows client environment are used to the
"My Documents" folder for their user to be synchronized with a network share.

![My Documents on Windows](images/whome/win.png)

This folder is also by default available on Ubuntu clients, but was not
documented until now.

## Access through /whome/$USER

The share for Windows "My Documents" can be reached by explicitly accessing the
path named like the user under `/whome`.

```bash
$ ls /whome/$USER
'My Documents'
```

It is an _automount_ path, i.e. it is only mounted when accessed.
__Note that `ls /whome` will not show anything, unless the path has been
recently used.__

## Setting up a shortcut

A shortcut can make things easier if you need to access this folder more often,
for example with a symlink or a bookmark in the file manager.

![Shortcut to /whome in Dolphin](images/whome/dolphin_link.png)
