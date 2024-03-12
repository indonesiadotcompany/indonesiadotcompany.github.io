---
title: "AIDE File Integrity Monitor (FIM) on Ubuntu"
date: 2024-03-12T17:07:54+07:00
tags: ["linux", "aide", "hids", "fim"]
author: "Widya"
draft: false
---

## Install AIDE
```
apt install aide
```

## Configure AIDE and initialize database
```
root@dlp:~# vi /etc/default/aide
# line 8 : if you do not use Cron job, comment out and turn to [no]
#CRON_DAILY_RUN=yes

root@dlp:~# vi /etc/aide/aide.conf
# add to the end : set exclude directories if you need
!/var/log
!/var/lib/aide
!/var/lib/apt
!/var/lib/dpkg
!/var/cache
!/run
# initialize database
root@dlp:~# aide --init --config /etc/aide/aide.conf
root@dlp:~# cp -p /var/lib/aide/aide.db.new /var/lib/aide/aide.db
```

## run checking
```
aide --check --config /etc/aide/aide.conf
```

## update  database
```
aide --update --config /etc/aide/aide.conf
cp -p /var/lib/aide/aide.db.new /var/lib/aide/aide.db
```

## Referensi:

* https://reintech.io/blog/configuring-advanced-intrusion-detection-aide-ubuntu-22
* https://www.rapid7.com/blog/post/2017/06/30/how-to-install-and-configure-aide-on-ubuntu-linux/
* https://www.server-world.info/en/note?os=Ubuntu_22.04&p=aide

