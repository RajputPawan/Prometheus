---
title: Certificate Management Application (CMA) for Linux
permalink: cma.html
sidebar: default_sidebar
tags: [docs]
keywords: email, certificates
last_updated: June 26, 2024
toc: true
folder: docs
---

## Installation
To download and install personal certificates for signing and encrypting emails as well as for signing documents you will need to do the following:

Start the CMA-Linux application by clicking on the menu entry (search for CMA-Linux)

![cma_01a](images/docs/cma/cma_01a.png)

**Please note:** after clicking it might take a few seconds to initialize.

The first time you start the application, an application key for your useraccount on the current machine will get generated. A progress dialog will be displayed.

![cma_02a](images/docs/cma/cma_02a.png)

Once the application key is generated, you will be asked if you want to download the certificates in case it did not yet happen before.

![cma_02b](images/docs/cma/cma_02b.png)

Click on OK.

You will see an information dialog:

![cma_03](images/docs/cma/cma_03.png)

Click on OK.

Your default browser will open asking you to log in with your regular intranet credentials.

![cma_04](images/docs/cma/cma_04.png)

Log on and authenticate via PingID.

After authentication, a xml file will get opened, containing a token string.

![cma_05](images/docs/cma/cma_05.png)

Mark the string (omitting the <> brackets) and copy it.

![cma_06](images/docs/cma/cma_06.png)

Now change back to the cma dialog window and paste the copied string in the dialog's entry field. Click on OK.

![cma_08](images/docs/cma/cma_08.png)

After a few seconds you should see the following messages.

![cma_09](images/docs/cma/cma_09.png)

A few minutes after a successful installation, you will receive also a mail mentioning the host the certificates were installed to.

![cma_10](images/docs/cma/cma_10.png)

## Using the certificates

The imported certificates and keys can be used for email (in GNOME Evolution)
and document signing (in Okular).

### GNOME Evolution for email

Your personal certificates can be used in [Evolution for E-Mail](
https://help.gnome.org/users/evolution/stable/mail-encryption-s-mime-signing-encrypting.html.en)

Select the certificates in your account settings, where you can also choose
other default settings for signing and encryption.

![cma_evolution_01](images/docs/cma/cma_evolution_01.png)

Now you can sign and encrypt new messages. The public certificates of the
recipients are automatically found in the address book.

![cma_evolution_02](images/docs/cma/cma_evolution_02.png)

See also our [Evolution setup guide]({% link pages/docs/evolution.md %}).

### Okular for PDFs

[Okular offers functionality for signing and verifying PDF documents](
https://docs.kde.org/stable5/en/okular/okular/signatures.html).

## Known issues

- Necessary scripts are not installed on devices that were installed using 'vanilla' (cli only) flavor.
- After network changes (e.g. Company-Network -> ZScaler), the generation of an appkey might not work. In such a case normally a reboot helps to get a proper connection to the backends.

