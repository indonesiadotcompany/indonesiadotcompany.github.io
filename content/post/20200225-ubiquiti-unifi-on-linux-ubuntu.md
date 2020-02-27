---
title: "Ubiquiti Unifi on Linux Ubuntu"
date: 2020-02-25T08:17:54+07:00
tags: ["linux", "ubiquiti, "unifi", "ubiquiti-unifi", "wireless", "access-point"]
author: "Widya"
draft: false
---

## Ubiquiti Unifi on Linux Ubuntu

```
apt-get update; apt-get install ca-certificates wget -y
wget https://get.glennr.nl/unifi/install/unifi-5.12.35.sh
bash unifi-5.12.35.sh
```

access your unifi controller at https://ip.of.your.server:8443


Referensi:

* https://community.ui.com/questions/UniFi-Installation-Scripts-or-UniFi-Easy-Update-Script-or-UniFi-Lets-Encrypt-or-Ubuntu-16-04-18-04-/ccbc7530-dd61-40a7-82ec-22b17f027776
* https://github.com/widcampur/ubiquiti-unifi-controller-install
