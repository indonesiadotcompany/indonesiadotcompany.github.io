---
title: "Suse SLES for the first time"
date: 2020-11-24T08:17:54+07:00
tags: ["linux", "suse", "sles", "tips", "subscription"]
author: "Widya"
draft: false
---

## SLES (Suse Linux Enterprise registration, repository

Prequisites:

* registration at myaccount.suse.com
* login
* go to download
* go to https://scc.suse.com/organizations/712401/subscriptions?family=sles and subscribe

```
SUSEConnect -r 57D5AC4E2693FAC6
sleep 30
SUSEConnect -p PackageHub/12.5/x86_64
```
test install suatu package
```
zypper -y install sudo
```

