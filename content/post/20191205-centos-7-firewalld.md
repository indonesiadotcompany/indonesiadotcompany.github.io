---
title: "Centos 7 Firewalld"
date: 2019-10-14T08:17:54+07:00
tags: ["linux", "server", "centos", "firewalld", "masquerade", "nat"]
author: "Widya"
draft: false
---

## Firewalld masquerade
* https://myredhatcertification.wordpress.com/2015/04/26/firewalld-masquerade-forwarding-transparent-proxy/

```
firewall-cmd --get-active-zones
firewall-cmd --list-all --zone=public
firewall-cmd --add-masquerade --zone=public --permanent
firewall-cmd --reload
firewall-cmd --list-all --zone=public
```

## Open port for specific ip address
* https://serverfault.com/questions/684602/how-to-open-port-for-a-specific-ip-address-with-firewall-cmd-on-centos
* https://www.liquidweb.com/kb/an-introduction-to-firewalld/

```
firewall-cmd --permanent --zone=public --add-rich-rule='
  rule family="ipv4"
  source address="1.2.3.4/32"
  port protocol="tcp" port="4567" accept'
```
