---
title: "Proxmox add zfs disk"
date: 2020-03-06T04:17:54+07:00
tags: ["linux", "proxmox", "zfs"]
author: "Widya"
draft: false
---

## Add Disk Hardware

Tambahkan harddisk di server secara berurutan port sata nya, dan catat ID disknya

## Setting at command line
```
ls -l /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC198J1R
ls -l /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC1999L4
zpool create rpoolkube -o ashift=12 mirror /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC198J1R /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC1999L4
zpool status
```

## Tambahkan proxmox storage pool

Dari proxmox pool, lalu klik storage, lalu add storage, pilih zfs.
Beri nama id storage nya, lalu pilih pool yang baru yaitu rpoolkube, lalu masukan block size 64k, lalu klik create.

Referensi:

* https://indonesiadot.com

