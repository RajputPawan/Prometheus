---
title: adtf installation and license requests
permalink: adtf.html
sidebar: default_sidebar
tags: [docs]
keywords: remote_access
last_updated: June 17, 2020
toc: true
folder: docs
---

## Procedure

0. Pre-requirement: sudo
1. Request License
2. Install ADTF
3. Activate ADTF

## License Request

Every Daimler employee with a Daimler mail address is allowed to request an ADTF license from digitalwerk.

* Send E-Mail with the following content to support@digitalwerk.net
```bash
  Hello,
  
  this is a license request for ADTF 2.x at Daimler AG.
  
  Hostname: <Hostname> 
  MAC Address: <MAC>
  
  Regards,
  <YourName>
```
* Digitalwerk replies within 2 days with a download link.


## Install ADTF

There are two possibilities to get adtf packages.
* install it from ubunturepo with apt-get (example: sudo apt-get install adtf)
* get packages from digitalwerk website (follow URL in reply mail)


## Activate ADTF license

```bash
sudo mv <pathToYourLicense> /etc/adtf2.lic
sudo chmod 644 /etc/adtf2.lic
```

ADTF is now ready to use.

## Further Topics

* Toolboxes: If you need any special toolboxes, you can get them from the digitalwerk website as well. 
* Licenses: Every license is host based. If you request a license for workstation "A", it won't work for workstation "B"
* Help: If you need any help with the installation, you can ask s+c/Atos for help by raising an incident ticket. But the license request you have to handle yourself.
