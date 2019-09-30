---
title: "Disk Serial Number"
date: 2019-09-30T13:09:15+07:00
show_reading_time: true
tags: ["disk", "tips", "raid", "zfs"]
author: "Widya"
draft: false
---

Pada saat implementasi raid software seperti menggunakan mdadm atau zfs (zfs manual atau zfs yang ada pada freenas), ada kalanya harddisk akan mengalami degraded / failure, untuk menggantinya harus diketahui serial number harddisk yang bermasalah.

Berikut adalah langkah yang dilakukan untuk mengetahui serial number dari harddisk:

* lsblk -o SERIAL /dev/sda (sesuaikan /dev/sda dengan disk yang akan dilihat, bisa /dev/sdb)
* smartctl -a /dev/sda #lihat bagian atas serial number nya
* udevadm info /dev/sda
