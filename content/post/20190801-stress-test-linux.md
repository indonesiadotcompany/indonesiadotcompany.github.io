---
title: "Stress test on Linux"
date: 2018-07-28T08:41:00Z
updated: 2018-07-28T08:43:05Z
show_reading_time: true
tags: ["disk", "cpu", "tips", "stresstest", "linux", "load"]
 
---

```
yum -y install wget
wget ftp://fr2.rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm
yum -y install stress-1.0.2-1.el7.rf.x86_64.rpm
stress -c 8 -i 4 -t 10s
stress -c 8 -i 9 -m 9 --vm-bytes 1024M
```

On ubuntu server, use apt to install stress

Ref:

* https://unix.stackexchange.com/questions/289588/no-package-stress-available-how-to-install-stress-on-centos-7-2
* https://www.cyberciti.biz/faq/stress-test-linux-unix-server-with-stress-ng/
