---
title: Skype with Pidgin Sipe Plugin
permalink: pidgin-sipe.html
sidebar: default_sidebar
tags: [docs]
keywords: skype
last_updated: March 20, 2020
toc: true
folder: docs
---

## Pidgin with the Sipe Plugin
Pidgin with Sipe has proven to be a valid replacement for Sky. As Sky was giving us a lot of problems and requires a license on an annual basis we are happy to get rid of it.

The only downside to Pidgin is its sometimes cumbersome operation.

This documentation will help you to circumnavigate these shortcomings.

## Initial Startup
In order to setup Pidgin with Sipe for the Daimler Skype server run
```
/usr/local/bin/pidgin-sipe-setup
```
This will create the respective configuration in your home directory (`~/.purple`).

In case you are already using Pidgin the setup script will not touch your current settings and will exit without effect. 
Please rename/move your .purple folder for the setup script to successfully finish.

On the first start of Pidgin please check that Password Keyring has been enabled by the setup script and that the keyring name is set to 'default'.

In the main window select

"Tools → Plugins"

![pidgin_keyring_1](images/docs/pidgin-sipe/pidgin_keyring_2.png)

![pidgin_keyring_2](images/docs/pidgin-sipe/pidgin_keyring_3.png)


## Usage
### Adding People to Your Buddy List

Unfortunately Pidgin-Sipe does not feature automatic address book retrieval. Thus you must add all your Buddies manually.

Either by search:

Select "Accounts → your.email@daimler.com yourid (Office Communicator) → Contact search..."

or by manually adding the user's mail address:

Select "Buddies → Add Buddies"
Insert `sip:email.address@daimler.com` as Buddy's username.

### Joining a Scheduled Conference

Select "Accounts → your.email@daimler.com yourid (Office Communicator) → Join scheduled conference..."

Insert the Skype link as displayed in the meeting entry e.g.

`https://meeting.wp.corpshared.net/daimler.com/meet/firstname.lastname/XYZ123ABC`

You will find a new tab in the Pidgin chat window e.g. "Chat #4" showing you all participants.

Once the meeting starts a dialog pops up asking you if you accept the meeting. Clicking Accept will start the audio conference.

When a participant shares his/her screen another popup will appear asking your permission.

### Sharing Your Screen
You can share your screen in the Chat window: 

Select "Conversation → More → Share my desktop".



