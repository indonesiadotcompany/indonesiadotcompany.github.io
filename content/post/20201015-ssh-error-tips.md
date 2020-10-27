---
title: "SSH error tips"
date: 2020-10-15T08:17:54+07:00
tags: ["linux", "ssh", "hosts.allow", "tips"]
author: "Widya"
draft: false
---

## ssh_exchange_identification read connection reset by peer

* https://phoenixnap.com/kb/fix-connection-reset-by-peer-ssh-error

There are typos at /etc/hosts.allow, in example:

shd: 10.11.8.15

it should be

sshd: 10.11.8.15


