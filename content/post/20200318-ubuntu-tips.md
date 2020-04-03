---
title: "Ubuntu tips"
date: 2020-03-18T07:17:54+07:00
tags: ["linux", "ubuntu", "tips"]
author: "Widya"
draft: false
---

## Install specific version
```
apt-cache policy gparted
apt install gparted=0.16.1-1
```

* https://askubuntu.com/questions/428772/how-to-install-specific-version-of-some-package

## apport high cpu
```
killall -9 apport
service apport stop && systemctl stop apport
rm -f /var/crash/*
apt-get remove apport -y
```


