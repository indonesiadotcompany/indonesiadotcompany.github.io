---
title: "Kernel Hardening Tips"
date: 2019-10-15T08:17:54+07:00
tags: ["linux", "kernel", "security", "hardening", "tips"]
author: "Widya"
draft: false
---

## Disable and blacklist Linux modules

Misal kita ingin blacklist module firewire_core, maka kita buat file /etc/modprobe.d/blacklist-firewire.conf yang isinya
```
blacklist firewire_core
install firewire_core /bin/true
```

Referensi:

* CIS_Red_Hat_Enterprise_Linux_7_Benchmark_v2.2.0.pdf
* https://linux-audit.com/kernel-hardening-disable-and-blacklist-linux-modules/

