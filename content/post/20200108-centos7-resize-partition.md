---
title: "Centos 7 Resize Partition"
date: 2020-01-08T08:17:54+07:00
tags: ["linux", "centos", "centos7", "partition", "tips"]
author: "Widya"
draft: false
---

## Step to reproduce on VM
Turn off the VM
```
qemu-img resize image.qcow2 +SIZE
```
where SIZE is the size to add (e.g. 10G for 10 gibibytes).

Turn on the VM, fdisk /dev/vda, delete and create /dev/vda2, restart

Login after restart, then run this command

```
pvresize /dev/vda2
lvextend -r -l +100%FREE /dev/mapper/centos-root
df -hl
```

Referensi:

* https://maunium.net/blog/resizing-qcow2-images/

