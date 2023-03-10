---
title: Bluetooth headsets - experimental sound settings and packages
permalink: bt-next.html
sidebar: default_sidebar
tags: [docs]
keywords: [bt-next, bluetooth, headset]
last_updated: March 10, 2023
toc: true
folder: docs
---

## Enabling experimental features for bluetooth headsets

Some modern bluetooth headsets need additional packages and/or additional settings to work properly on linux. While in case of systems running 22.04 it is mostly an issue of providing additional settings, for focal additional and backported packages are needed to make them work.

There is an option to opt-in to receive updated packages for pulseaudio and bluez (needed only for Ubuntu 20.04) together with centrally managed settings automatically applied. You can request by a ticket to include your system(s) to centrally managed setup of these features.

Please be aware that these features are marked as experimental for a reason, hence expect things to break. If you are not sure if your particular setup will benefit from the changes, please do not request it on a production machine, as after enabling the feature, you will receive limited support only.

## If you want to opt-in

If you opt-in to enable the the experimental repository (currently Ubuntu 20.04 only) and to receive the configuration changes together with the helper scripts (all supported versions), you should know that these settings might break certain setups that were not availabe for testing by our team, and might cause issues in combination with other programs making use of the pulseaudio and bluez stacks.

Issues encountered with the experimental features enabled will cause that errors encountered will be worked on by Ubuntu Operations Team on best-effort basis only.

Request to opt in filing a ticket including the following data:

```text
Please change the host configuration to automatically receive experimental bluetooth features.
I am aware that packages and settings provided by this change might break my existing setup and
I know that I will receive support on best-effort base only if things will break.

Please apply to this/these host(s):
  - cmtcleu...

Thank you
```

[Link](./requests.html) to requests how-to page. (Click "Other")
