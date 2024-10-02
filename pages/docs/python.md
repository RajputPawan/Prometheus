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

<code style="color : Red">ATTENTION: Do not install different Python versions. Especially not Python 2.X on a Python 3.X system.</code>
<code style="color : Red">If your Python customization will break your system, we will reinstall it.</code>


## Virtual environment

Easiest variant, use a Python venv instead of installing Libraries sytem wide.


### Creation

```python3 -m venv <venv path>```

Requirements

```<venv path>``` A directory where the vitual environment should be installed to.
The package python3-venv. If missing, can be installed via ```apt-get install python3-venv```


### Usage

Additional packages/libraries can be installed within this venv via the command

```<venv path>/bin/python3 -m pip install <package>``` (from outside of the venv path)
```./bin/python3 -m pip install <package>``` (if your current terminal directory is the venv directory)


For a more detailed how to use or work with Python venv, please check the Internet, where a lot of entries can be found about that topic.

I don't want to write another one, and increase the already to high count.



### Restrictions

Python virtual environments uses the Python version which are installed on the system.

Python venv can only prevent that you have to install libraries/packages system wide.


## Pyenv

Provides Python venv with the ability to change/choose the used Python version.


### Prerequisites

You need to install some additional packages.

```apt-get install libreadline-dev libncurses5-dev```

If there are still build errors, check [https://github.com/pyenv/pyenv/wiki/Common-build-problems](https://github.com/pyenv/pyenv/wiki/Common-build-problems)


### Install

The installation can be done completely in the users home directory, no root rights required. Except for installing the prerequisites)

```git clone https://github.com/pyenv/pyenv.git ~/.pyenv```

you also can choose another target loation instead of ```~/.pyenv``` (the further documentation on this page is using the default location)


A more detailed installation howto and also a howto, can be found on:

[https://github.com/pyenv/pyenv?tab=readme-ov-file#automatic-installer](https://github.com/pyenv/pyenv?tab=readme-ov-file#automatic-installer)


### Using

If installation is successful, you can install different Python version with
```~/.pyenv/libexec/pyenv install <version>```
or first get a list of all available versions
```~/.pyenv/libexec/pyenv install --list```

Virtual environment with pyenv

```~/.pyenv/libexec/pyenv virtualenv <python version> <environnment name>```

If installed as normal user, the environments are stored under ```~/.pyenv/versions/<python version>/envs/```

To make your life easier, i suggest to create symlinks to the important directorys/executables, e.g.
```ln -s ~/.pyenv/libexec/pyenv ~/pyenv```


For a more detailed how to use or work with Python venv, please check the Internet, where a lot of entries can be found about that topic.

I don't want to write another one, and increase the already to high count.



