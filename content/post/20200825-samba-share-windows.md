---
title: "Samba share windows"
date: 2020-08-25T15:17:54+07:00
tags: ["linux", "windows", "samba", "share"]
author: "Widya"
draft: false
---

## Setup samba on ubuntu linux
* https://adrianmejia.com/how-to-set-up-samba-in-ubuntu-linux-and-access-it-in-mac-os-and-windows/
```
apt install samba cifs-utils
```
lalu edit /etc/samba/smb.conf
```
systemctl restart smbd
```
test via windows, dengan mengakses \\ip.atau.hostname.server


