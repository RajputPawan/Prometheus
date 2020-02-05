---
title: Saltmigration Git Workflow 
permalink: git_workflow.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: Feburary 4, 2020
toc: true
folder: docs
---

## General Workflow

There are two permanent branches `master` and `integration`. A new feature gets implemented by creating a new branch from `integration`. After local testing and committing the code, the code can get pushed to your branch. A testing pipeline is running and returns "successful" or "failed". If "successful" a Pull Request can be created from your branch to the `integration` branch. A merge from your branch to the `integration` branch is only possible with a successful execution of the pipeline and the approval of one pre-defined reviewer.

After a successful merge to `integration` another Pull Request can be opened to merge into the `master` branch.

Click **[here]({{ site.baseurl }}/git_general_workflow.html)** for a graphical representation of the described workflow. 

## Hotfixes

For further information look at [Link]({{ site.baseurl }}/git_hotfix_workflow.html)
