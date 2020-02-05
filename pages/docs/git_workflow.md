---
title: Salt Workflow 
permalink: git_workflow.html
sidebar: default_sidebar
tags: [docs]
keywords: disk encryption, encryption
last_updated: Feburary 5, 2020
toc: true
folder: docs
---

## Getting Started

![task_workflow](images/docs/salt_workflow/task_workflow.png)

> Every feature or hotfix gets a separate task and branch!

1. [GSEP](https://gsep.daimler.com/)
2. [Jira](https://gsep.daimler.com/Jira)
3. Project: RD Ubuntu Operations
4. Board: Saltmigration
5. Create:
  - Issue Type: Task
  - Add Summary
  - Component: Atos, B1, Daimler
  - Label: Saltmigration
6. In the created task on the right side there is a section "Development" with a "Create branch" button: <br>
![task_create_branch](images/docs/salt_workflow/task_create_branch.png)
7. Create a branch: <br>
![create_branch](images/docs/salt_workflow/create_branch.png)
8. The assignee of the task pulls the remote changes from the repo and changes to the previously created branch:
```bash
git pull
git checkout <branchname>
```
9. Apply changes
  - add/comment/remove code
  - test changes locally
  - stage changes
  - commit changes
  - push changes to your branchname
10. Test Pipeline is running, generating a report
  - If successful: Open Pull Request to merge your changes to integration branch
  - If unsuccessful: Fix your code, commit and push again
11. If Pull Request gets accepted, the Jira task changes: <br>
![task_final](images/docs/salt_workflow/task_final.png)
12. Comment on Jira task about relevant information
13. Task gets closed if content of the task gets successfully merged from integration to master branch


## Branching Setup

The branching of the [Saltstack Repository](https://gsep.daimler.com/stash/projects/UBUNTUOP/repos/saltstack/browse) is setup as the following:

![workflow_pipeline](images/docs/salt_workflow/workflow_pipeline.png)

Each Pull Request requires a successfully ran pipeline and at least one approval of the default-reviewer group. The pipeline gets automatically triggered by pushing into a branch or opening a Pull Request.

## General Workflow

There are two permanent branches `master` and `integration`. A new feature gets implemented by creating a new branch from `integration`. After local testing and committing the code, the code can get pushed to your branch. A testing pipeline is running and returns "successful" or "failed". If "successful" a Pull Request can be created from your branch to the `integration` branch. A merge from your branch to the `integration` branch is only possible with a successful execution of the pipeline and the approval of one pre-defined reviewer.

After a successful merge to `integration` another Pull Request can be opened to merge into the `master` branch.

Click **[here]({{ site.baseurl }}/git_general_workflow.html)** for a graphical representation of the described workflow. 

## Hotfixes

It should not be possible to merge from branch `hotfix` directly into the `master` branch without testing or rolling out the changes to the test group before going into production. Therefor if a hotfix is needed (e.g. package update breaks a whole system, config change interrupts workflow, ...) a `hotfix` branch should be generated from `integration`. Any changes can be developed and applied and merged via Pull Request to `integration`. After a successful pipeline run, a Pull Request can be opened to merge into `master`. Approvals of hotfix-Pull Requests should be prioritized by the default reviewers.

Click **[here]({{ site.baseurl }}/git_hotfix_workflow.html)** for a graphical representation of the described workflow.

The default `integration` branch without a hotfix:

![features_in_int](images/docs/salt_workflow/features_in_int.png)


To stall the already implemented features in `integration` branch, without them merging with the hotfix into `master`, the following commands need to be applied, where 'A' is the commit-id (see `git log`):

```bash
git checkout -f A -- .
git commit -a
```

After these commands the branches look like the following:

![hotfix](images/docs/salt_workflow/hotfix.png)
