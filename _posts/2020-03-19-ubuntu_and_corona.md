---
title:  "Using Ubuntu during Corona Lockdown"
published: true
permalink: 2020-03-19_ubuntu_and_corona.html
summary: "Hints and tools to use during corona lockdown"
tags: [news, corona, remote_access]
---

Our provider ATOS (s+c) will be available as usual. Permanent onsite presence in Vaihingen has been suspended. Onsite action is limited to actual cases.

## Hotline
As ATOS moved most of their employees to work from home they are still having some issues with their hotline. If you can't get through please open a ticket via http://ubuntu.rd.corpintra.net and request to be called back.

## Remote access
The new ipsec based VPN solution on Windows 10 is not available for Ubuntu. Please stick to AlwaysOn with or w/o Token.

Any limitations as of bandwidth or general availability are worked on. Currently the plan is to move as many Win10 users over to ipsec as possible thus taking load from AlwaysOn.

## Tools to Use

### AlwaysOn
AlwaysOn requires a valid machine certificate and the computer must have booked the service AlwaysOn in ITShop. If you are having issues please open a ticket with ATOS.

### x2go for Graphical Remote Desktop Access
We have rolled out x2go to all Ubuntu clients. Find more info here: [x2go.html](/x2go.html)

### Pidgin-Sipe to use Skype
We are currently working on the rollout of Pidgin with the Sipe plugin. We found this to be a reliable replacement for Sky where we have run out of valid licenses.

Once Pidgin-Sipe has been installed on your computer there will be a `/usr/local/bin/pidgin-sipe-setup` script available that will configure Pidgin-Sipe to work with the Daimler Skype backend systems and make sure that your password is stored in gnome keyring.


{% include links.html %}
