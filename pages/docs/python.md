---
title: Python
permalink: python.html
sidebar: default_sidebar
tags: [docs]
keywords: python
last_updated: Aug 09, 2024
toc: true
folder: docs
---

# How to deal with Python, and not break the system

ATTENTION: Do not install different Python versions. Especially not Python 2.X on a Python 3.X system.

If your Python customization will break your system, we will reinstall it.



## Virtual environment

Easiest variant, use a Python venv instead of installing Libraries sytem wide.


### Creation

```python3 -m venv <venv path>```

Requirements:

<venv path>: A directory where the vitual environment should be installed to.
The package python3-venv. If missing, can be installed via ```apt-get install python3-venv```


### Usage

Additional packages/libraries can be installed within this venv via the command

```<venv path>/bin/python3 -m pip install <package>``` (from outside of the venv path)
```./bin/python3 -m pip install <package>``` (if your current terminal directory is the venv directory)


### Restrictions

Python virtual environments uses the Python version which are installed on the system.

Python venv can only prevent that you have to install libraries/packages system wide.


## Pyenv

### Prerequisites

You need to install some additional packages.

```apt-get install libreadline-dev libncurses5-dev```

If there are still build errors, check [https://github.com/pyenv/pyenv/wiki/Common-build-problems](https://github.com/pyenv/pyenv/wiki/Common-build-problems)


### Install

The installation can be done completly in the users home directory, no root rights required. Except for installing the prerequisites)

How to install, is explained on the Projects github page.
[https://github.com/pyenv/pyenv?tab=readme-ov-file#automatic-installer](https://github.com/pyenv/pyenv?tab=readme-ov-file#automatic-installer)


