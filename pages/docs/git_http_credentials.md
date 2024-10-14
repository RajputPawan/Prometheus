---
title: Git credentials in keyring
permalink: git_http_credentials.html
sidebar: default_sidebar
tags: [docs]
keywords: apt
toc: true
folder: docs
---

# Avoid saving git credentials in plaintext file

Git credentials like username, password and access tokens can be saved in your
desktop session keyring with `git-credential-libsecret` (see
<https://git-scm.com/doc/credential-helpers>).

We provide a helper script to build the required tool on your system because
it is not officially packaged for Ubuntu yet.

The following steps are requied to use it:

## 1. Build helper

Run `build-git-credential-libsecret.sh`.

```
$ build-git-credential-libsecret.sh 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libsecret-1-dev is already the newest version (0.20.5-2).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Cleanup
Compile 'git-credential-libsecret'
gcc -g -O2 -Wall  -pthread -I/usr/include/libsecret-1 -I/usr/include/gio-unix-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -o git-credential-libsecret.o -c git-credential-libsecret.c
gcc -o git-credential-libsecret  git-credential-libsecret.o -lsecret-1 -lgio-2.0 -lgobject-2.0 -lglib-2.0
Copy 'git-credential-libsecret' to '/usr/libexec/git-core/git-credential-libsecret'
```

## 2. Git config

```
git config --global credential.helper /usr/libexec/git-core/git-credential-libsecret
```

This sets the libsecret helper as default in your `~/.gitconfig`:

```
[credential]
        helper = /usr/libexec/git-core/git-credential-libsecret
```

## 3. Start using

The next time you try to access a repository with authentication via
`https://…`, Git will ask for credentials and store them in the GNOME keyring.
