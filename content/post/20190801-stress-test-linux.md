---
title: "Stress test on Linux"
date: 2018-07-28T08:41:00Z
updated: 2018-07-28T08:43:05Z
show_reading_time: true
tags: ["disk", "cpu", "tips", "stresstest", "linux", "load"]
 
---

```
stress -c 8 -i 9 -m 9 --vm-bytes 1024M

Ref:

* https://unix.stackexchange.com/questions/289588/no-package-stress-available-how-to-install-stress-on-centos-7-2
* https://www.cyberciti.biz/faq/stress-test-linux-unix-server-with-stress-ng/
