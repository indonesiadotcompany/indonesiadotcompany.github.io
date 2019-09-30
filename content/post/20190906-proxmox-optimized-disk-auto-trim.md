---
title: "Proxmox optimized disk for auto trim / shrink"
date: 2019-09-02T08:17:56+07:00
tags: ["server", "linux", "virtualization", "proxmox", "tips"]
categories: ["virtualization"]
author: "Widya"
---

Dalam implementasi proxmox, yang harus diperhatikan adalah type disk pada awal pembuatan, ini berguna agar disk system secara keseluruhan tidak cepat full, dan fungsi dari *thin provision storage* atau storage yang bisa tetap thin sesuai file yang ada di vm, bukan berdasarkan disk yang dialokasikan.

Adapun persyaratan untuk ini yaitu:

* menggunakan *thin provisioned backing storage* seperti qcow2, thin-lvm, zfs pada server proxmox nya
* menggunakan Virtio SCSI controller pada guest option vm nya
* Menggunakan SCSI bus/device saat pembuatan hdd pada guest vm nya dan check bagian discard option nya
* Tambahkan discard mount options di /etc/fstab nya guest vm
* Enable fstrim.timer pada systemctl

Untuk membuktikannya, sambil mengecek di server proxmox dengan menggunakan command `zfs list` jika memakai zfs, `lvs` atau `lvdisplay` untuk thin-lvm, atau `du -sch` jika memakai qcow2 untuk mengetahui besar file sebelum dan setelah di guest vm nya dijalankan command `fstrim -av`

Referensi:

* https://pve.proxmox.com/wiki/Shrink_Qcow2_Disk_Files
* https://kparal.wordpress.com/2017/10/06/automatically-shrink-your-vm-disk-images-when-you-delete-files/
