---
title: Salt Workflow 
permalink: git_workflow.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: Feburary 4, 2020
toc: true
folder: docs
---

## Branching Setup

The branching of the [Saltstack Repository](https://gsep.daimler.com/stash/projects/UBUNTUOP/repos/saltstack/browse) is setup as the following:

![workflow_pipeline](images/workflow_pipeline.png)

Each Pull Request requires a successfully ran pipeline and at least one approval of the default-reviewer group. The pipeline gets automatically triggered by pushing into a branch or opening a Pull Request.

## General Workflow

There are two permanent branches `master` and `integration`. A new feature gets implemented by creating a new branch from `integration`. After local testing and committing the code, the code can get pushed to your branch. A testing pipeline is running and returns "successful" or "failed". If "successful" a Pull Request can be created from your branch to the `integration` branch. A merge from your branch to the `integration` branch is only possible with a successful execution of the pipeline and the approval of one pre-defined reviewer.

After a successful merge to `integration` another Pull Request can be opened to merge into the `master` branch.

Click **[here]({{ site.baseurl }}/git_general_workflow.html)** for a graphical representation of the described workflow. 

## Hotfixes

It should not be possible to merge from branch `hotfix` directly into the `master` branch without testing or rolling out the changes to the test group before going into production. Therefor if a hotfix is needed (e.g. package update breaks a whole system, config change interrupts workflow, ...) a `hotfix` branch should be generated from `integration`. Any changes can be developed and applied and merged via Pull Request to `integration`. After a successful pipeline run, a Pull Request can be opened to merge into `master`. Approvals of hotfix-Pull Requests should be prioritized by the default reviewers.

Click **[here]({{ site.baseurl }}/git_hotfix_workflow.html)** for a graphical representation of the described workflow.

The default `integration` branch without a hotfix:

![features_in_int](images/features_in_int.png)


To stall the already implemented features in `integration` branch, without them merging with the hotfix into `master`, the following commands need to be applied, where 'A' is the commit-id (see `git log`):

```bash
git checkout -f A -- .
git commit -a
```

After these commands the branches look like the following:

![hotfix](images/hotfix.png)
