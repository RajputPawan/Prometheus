---
title: Evolution with EWS plugin  
permalink: evolution.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: January 23, 2020
toc: true
folder: docs
---

## E-Mail with Evolution

`Currently this application is not officially supported by Daimler. Use at your own risc. Don't expect support from the Help Desk.`
`Instead search for help in the community e.g. the Social Intranet or AskDaisy.`

### Setup

Outlook (MS Exchange) can be used on Ubuntu with Evolution and the Evolution EWS plugin.

Install the following packages and start Evolution:

```bash
sudo apt-get install evolution evolution-ews
evolution &
```

On startup the Evolution's inital configuration wizard shows up.

1. Click next until asked for your identity.
    1. Fill in your name and email address.
    2. uncheck the "Look up mail server ..." box
    ![evolution_0](images/docs/evolution/evolution_0.jpg)
2. Click next.
    1. Choose Server Type: Exchange Web Services
    2. Replace Username with: <your userid>@emea.corpdir.net
    3. Replace Host URL with: https://msg-services.wp.corpshared.net/ews/Exchange.asmx
    4. Select Kerberos for authentication
    5. Click on "Fetch URL"
    ![evolution_1](images/docs/evolution/evolution_1.png)
    6. Click OK
3. Click Next multiple times until Done. Click Apply.
4. Outlook connects to Daimler MS Exchange Server w/ full support for Mail, Calendar, Contacts and ToDo.



### Accessing shared calendars
1. Set up evolution with ews and get your inbox functional. Make sure you're online, and syncing.
2. On the Mail view, right click your exchange account, select "Subscribe to folder of other EWS user."
3. Type in the name of the account you want, and choose Calendar from the dropdown.

Calendar will then be visible in calendar view.

### Advanced search / searching the Outlook way

To be able to filter and search your email more specifically you can select "Free form expression":

![evolution_2](images/docs/evolution/evolution_2.png)

Search documentation by evolution: <a href="https://help.gnome.org/users/evolution/stable/mail-searching.html.en">https://help.gnome.org/users/evolution/stable/mail-searching.html.en</a>

Documentation of available free form expressions: <a href="https://bugzilla.gnome.org/show_bug.cgi?id=550796#c10">https://bugzilla.gnome.org/show_bug.cgi?id=550796#c10</a>