---
title: E-Mail using Evolution with EWS plugin
permalink: evolution.html
sidebar: default_sidebar
tags: [docs]
keywords: email, mail, outlook, office, o365
last_updated: June 28, 2024
toc: true
folder: docs
---

## E-Mail with Evolution

GNOME Evolution is our supported native email client.

### Request UBUNTUUSERS role in Alice

The prerequisite for logging into your account in Evolution is that you are a
member of a certain Azure / Entra ID group.

[You can self-request membership in Alice.](
https://alice.mercedes-benz.com/access/accessRequest)

See below Screenshots on how to do this:

![alice1](images/docs/evolution/alice_1.png)

![alice2](images/docs/evolution/alice_2.png)

![alice3](images/docs/evolution/alice_3.png)

![alice4](images/docs/evolution/alice_4.png)

![alice5](images/docs/evolution/alice_5.png)

__After assigning yourself the UBUNTUUSERS role, please wait for about one day for
the synchronization between Alice and Azure / Entra ID to happen!__

### Setup (with Email address @mercedes-benz.com, Office 365)

Outlook (MS Exchange) can be used on Ubuntu with Evolution and the Evolution EWS plugin.

Install the following packages and start Evolution:

```bash
sudo apt-get install evolution evolution-ews
evolution &
```

On startup the Evolution's inital configuration wizard shows up.

Fill in the details as shown in these pictures.

Enter in Username your @mercedes-benz.com Email address

Enter in Host URL: <https://outlook.office365.com/EWS/Exchange.asmx>

Instead of "NTLM" choose "OAuth2 (Office365)"

![evolution_6](images/docs/evolution/evolution-o365_2.jpeg)

In "Override Office365 OAuth2 settings"

Enter the Application ID: 751cf8be-ca07-484b-9308-fac4b9d85eff

![evolution_7](images/docs/evolution/evolution-o365_3.jpeg)

Verify the highlighted items:

![evolution_5](images/docs/evolution/evolution-o365_1.jpeg)

You should see the following picture:

![evolution_4](images/docs/evolution/evolution-o365_0.jpeg)

Click OK

Note: Emails can also be read in the web browser via this link: <https://outlook.office.com/>

### Setup S/MIME encryption

[__Now we also support S/MIME email signing and encryption on our systems!__](
/ubunturd/ubuntudoc/cma.html)

### OAuth2 authorization via an external browser

Due to changes in the scripts redirecting requests to
sso.mercedes-benz.com and login.microsoft.com, the embedded browser
component somtimes can not be used for OAuth2 authorization. The Ubuntu
Operations RD Team therefore backported upstream patches to allow the
use of an external browser for the authorization part.

When the authorization dialog opens in the embedded component, click on the small arrow symbol in the right corner of the address line.

![evolution_oauth2_1](images/docs/evolution/evolution-oauth2-1.jpg)

This will open the same dialog in the default browser. Here the one can continue with the regular logon/PingID procedure.

After a successfull authorization the page in the external browser will be redirected to a login.microsoft.com page without content.

![evolution_oauth2_2](images/docs/evolution/evolution-oauth2-2.jpg)

Copy the entire address line.

![evolution_oauth2_3](images/docs/evolution/evolution-oauth2-3.jpg)

Now paste the copied address to the authorization code field in evolution and click on continue to finish the authorization process.

### Known Issues

![EvolutionErrorAzureAD](images/docs/evolution/EvolutionErrorAzureAD.png)

If you see an error message "Your administrator has cofigured the Application GNOME Evolution EWS [...] to block users unless they are specifically granted [...]" you most likely are not part of the AzureAD group that is allowed to use Evolution as email client.

[See above for instructions on how to get access](
#request-ubuntuusers-role-in-alice)

### Setup (mailbox not yet migrated to O365)

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
    2. Replace Username with: `<your userid>@emea.corpdir.net`
    3. Replace Host URL with: `https://msg-services.wp.corpshared.net/ews/Exchange.asmx`
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

Search documentation by evolution: [https://help.gnome.org/users/evolution/stable/mail-searching.html.en](https://help.gnome.org/users/evolution/stable/mail-searching.html.en)

Documentation of available free form expressions: [https://bugzilla.gnome.org/show_bug.cgi?id=550796#c10](https://bugzilla.gnome.org/show_bug.cgi?id=550796#c10)
