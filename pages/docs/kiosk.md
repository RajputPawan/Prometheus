---
title: Kiosk Mode
permalink: kiosk.html
sidebar: default_sidebar
tags: [docs]
keywords: kiosk
last_updated: April 17, 2020
toc: true
folder: docs
---
## Prerequisites

* One should be a member of the following group, as access has been restricted on the kiosk machines: `kiosk_$HOSTNAME`
  * Group membership can be verified by the following command:

    ~~~bash
    $ groups <USER>
    <USER> : ... kiosk_$HOSTNAME
    ~~~

  * If this is not the case then one should notify the group responsible, so that the latter can grant access to the group via [Unix Gruppentool / Unix group tool](https://wwwhks.rd.corpintra.net/ugt/fass)
* Eventually log in on the desired `$KIOSK_MACHINE` as `kioskuser`:

  ~~~bash
  $ ssh $KIOSK_MACHINE
    
  # On $KIOSK_MACHINE
  $ su - kioskuser
  ~~~~
  
## Settings Modification as kioskuser

* User specific chromium-browser data is stored in: `/lhome/kioskuser/.config/chromium-browser`
  * Chromium flags set in `/etc/chromium-browser/default` can be overriden under `/lhome/kioskuser/.config/chromium-flags.conf`.  
  
  **NOTE:** Create the file if one does not exist and populate it with desired chromium flags.

  ~~~bash
  # Flag to set window resolution and window position
  --window-size=1920,1080 --window-position=0,0
  ~~~

  * More chromium-browser command line switches should be found in the following link:  
  [List of Chromium Command Line Switches](https://peter.sh/experiments/chromium-command-line-switches/)
* Depicted URLS can be appended or deleted in `/lhome/kioskuser/.xinitrc`
* The script `/lhome/kioskuser/switch_tab` is responsible for switching of the chromium-browser tabs and the stipulated execution time is set as cron job in `/var/spool/scron/cron/crontabs/kioskuser`.

  ~~~~bash
  $ crontab -l
  */5 * * * * $HOME/switch_tab
  ~~~

* The cron job can be modified on **CLI** via:

  ~~~bash
  $ crontab -e
  ~~~
