---
title: "Centos 7 Firewalld masquerade"
date: 2019-10-14T08:17:54+07:00
tags: ["linux", "server", "centos", "firewalld", "masquerade", "nat"]
author: "Widya"
draft: false
---

## Firewalld masquerade

```
firewall-cmd --get-active-zones
firewall-cmd --list-all --zone=public
firewall-cmd --add-masquerade --zone=public --permanent
firewall-cmd --reload
firewall-cmd --list-all --zone=public
```

Referensi:

* https://myredhatcertification.wordpress.com/2015/04/26/firewalld-masquerade-forwarding-transparent-proxy/

