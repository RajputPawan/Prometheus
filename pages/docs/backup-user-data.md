---
title: Backup User Data - Using Pre-Installed Tools
permalink: backup-user-data.html
sidebar: default_sidebar
tags: [docs]
keywords: backup, user, data, luckybackup, deja-dup
last_updated: April 06, 2023
toc: true
folder: docs
---

Both `LuckyBackup` and `Deja-Dup` are popular backup solutions for Ubuntu, and
each has its own advantages and disadvantages.

`LuckyBackup` is a simple and easy-to-use graphical tool that allows you to
schedule backups and sync files between two locations. It is a good option for
basic backup needs and for those who prefer a user-friendly interface.
However, it may not have as many advanced features as Deja-Dup.

`Deja-Dup` is a more powerful backup solution that provides advanced features
such as encryption, compression, incremental backups, and remote backups. It is
a command-line tool that may require some technical knowledge to set up and
use, but it provides greater flexibility and control over your backups.
Deja-Dup uses `Duplicity` as the backend.

Both tools are pre-installed on RD Ubuntu Clients.

### Setup - luckybackup

Start the tool from the command line, in the following example from the home directory:

```bash
luckybackup
```

On startup the follwoing window shows up:


![backup_1](images/docs/backup-user-data/luckybackkup-startup.png)

To create a backup task Click on the icon at the right side: `+ add` 
then the following window appears:

![backup_3](images/docs/backup-user-data/luckybackup-add.png)

Enter a name of the backup task and specify source and destination directories.
In this example, the backup destination resides in /tmp, it can be any directory
on a mounted filesystem (USB Disk, Network Share).

![backup_4](images/docs/backup-user-data/luckybackup-validate.png)

You have the option to validate the entered data: Clock on `validate` then this
shows up (example):

You even get the `rsync` command which would be executed:

![backup_5](images/docs/backup-user-data/luckybackup-validate-result.png)

Click `Okay`

You get back to the Task properties window:

Click `Okay`

You get back to the task list. 

Now you have to select the backup task.

You have the option to click on `Dry`, should you wish to perform a dry run of
the backup task.

Let's do that in this example:


After having selected the task, Click `Dry` and then `Run`

You get a summary and the elapsed time of the task in `simulation mode`.

Click `Done`, unselect `Dry` and Click `Run` again.

You get the summary and the elapsed time of the actual (in this case manually
performed) backup run.

Click `Done` which brings you back to the task list.

Say you want to regularly perform this backup task, for which the cron facility
will be used:

Click `Schedule` (round button or select Profile/Schedule).

![backup_6](images/docs/backup-user-data/luckybackup-empty-schedule.png)

Note, you may view your current crontab entry.

Click `Add` 

![backup_7](images/docs/backup-user-data/luckybackup-default-schedule.png)

In case you leave the defaults, by Clicking `okay` then the backup task would be
executed every day at midnight. Note, select a suitable crontab entry when your
Client will actually be online.

To add it to your personal crontab, Click on `cronIT !!`

![backup_8](images/docs/backup-user-data/luckybackup-croned.png)

Click `Okay` then `close` which  brings you back to the task list.

Click the `Quit` button, or select Profile/Quit to exit luckybackkup.

As luckybackup is **rsync** based, the saved files are accessible by
standard Linux commands on the backup location, in case you want to retrieve
individual files. You also have the option to create a **restore task** by
selecting a backup task from within the task list then selecting Task/Create
Restore task and follow the instructions.


### Setup - deja-dup

Start the tool from the command line:

```bash
deja-dup
```
On startup the follwoing window shows up:


![backup_2](images/docs/backup-user-data/deja-dup-startup.png)


Click `Create My First Backup`


![backup_9](images/docs/backup-user-data/deja-dup-backup.png)

Via `+` and/or `-` select what you intend to backup, by selecting the
`Folders to Back Up` and the `Folders to Ignore`:

![backup_10](images/docs/backup-user-data/deja-dup-what-to-backup.png)

Click `Forward`

Select `Storage Location`, where you have the options `Local Folder`,
`Network Server`, and `Google Drive`.

You have the option to protect your backup by providing a password, otherwise
select `Allow restoring without a password`.

Click `Forward` and the backup is going to be performed, returning to this
Overview window:

![backup_11](images/docs/backup-user-data/deja-dup-overview.png)

Note, via the Triple Bar (aka hamburger menu) you may select `Preferences` to change
the backup specification.

### Documentation

In English:

[https://luckybackup.sourceforge.net/manual.html](https://luckybackup.sourceforge.net/manual.html)

[https://wiki.ubuntu.com/DesktopTeam/Specs/Oneiric/DejaDup](https://wiki.ubuntu.com/DesktopTeam/Specs/Oneiric/DejaDup)

In German:

[https://wiki.ubuntuusers.de/luckyBackup/](https://wiki.ubuntuusers.de/luckyBackup/)

[https://wiki.ubuntuusers.de/D%C3%A9j%C3%A0_Dup/](https://wiki.ubuntuusers.de/D%C3%A9j%C3%A0_Dup/)

