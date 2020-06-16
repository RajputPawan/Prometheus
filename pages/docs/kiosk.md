---
title: Kiosk Mode
permalink: kiosk.html
sidebar: default_sidebar
tags: [docs]
keywords: kiosk
last_updated: June 10, 2020
toc: true
folder: docs
---
## Prerequisites

### Group Membership Verification

* One should be a member of the following group, as access has been restricted on the kiosk machines: 

~~~vim
emtc_ee1_kiosk-$HOSTNAME
~~~  

~~If this is not the case then one should notify the group responsible, so that the latter can grant access to the group via [Unix Gruppentool / Unix group tool](https://wwwhks.rd.corpintra.net/ugt/fass).~~  

* The afore-assigned **LDAP** groups `kiosk_$HOSTNAME` are now defunct and their memberships have been re-assigned to their corresponding **Active Directory** groups `emtc_ee1_kiosk-$HOSTNAME`. Group responsibility i.e ownership and membership have also been transferred to the new groups.
  * When the groups are created in **Active Directory** (with **[Admin.NET](https://adselfservice.app.corpintra.net/WebGM/GMMaintenance_Web/GMMaintain.aspx)**), one can specify which user should be the owner and which other 5 users should be deputies.
* Administration of the group membership is also possible via **[Admin.NET](https://adselfservice.app.corpintra.net/WebGM/GMMaintenance_Web/GMMaintain.aspx)** as depicted in the attached **['Admin.NET User Manual'](images/docs/kiosk/Admin.net Self Service.pdf)**.

## Settings Modification as kioskuser

### URL Modification in Chromium Browser

* Log into the desired `$KIOSK_MACHINE` as `kioskuser`:

  ~~~bash
  $ ssh $KIOSK_MACHINE

  # On $KIOSK_MACHINE
  $ su - kioskuser
  ~~~~
  
* User specific chromium-browser data is stored in:

  ~~~bash
  /lhome/kioskuser/.config/chromium-browser
  ~~~

* Chromium flags set in `/etc/chromium-browser/default` can be overriden under:

  ~~~bash
  /lhome/kioskuser/.config/chromium-flags.conf
  ~~~
  
  **NOTE:**  Create the file if one does not exist and populate it with desired chromium flags.

  ~~~bash
  # Flag to set HD window resolution and window position
  --window-size=1920,1080 --window-position=0,0
  ~~~

* More chromium-browser command line switches should be found in the following link:  
 **[List of Chromium Command Line Switches](https://peter.sh/experiments/chromium-command-line-switches/)**
* Depicted URLS can be appended or deleted in `/lhome/kioskuser/.xinitrc`

### Cronjob

* The script `/lhome/kioskuser/switch_tab` is responsible for switching of the chromium-browser tabs and the stipulated execution time is set as cron job in `/var/spool/cron/crontabs/kioskuser`.

  ~~~~bash
  $ crontab -l
  */5 * * * * $HOME/switch_tab
  ~~~

* The cron job can be modified on **CLI** via:

  ~~~bash
  $ crontab -e
  ~~~
