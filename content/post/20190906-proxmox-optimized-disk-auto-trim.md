---
title: "Proxmox optimized disk for auto trim / shrink"
date: 2019-09-02T08:17:56+07:00
tags: ["server", "linux", "virtualization", "proxmox", "tips"]
categories: ["virtualization"]
author: "Widya"
---

Dalam implementasi proxmox, yang harus diperhatikan adalah type disk pada awal pembuatan, ini berguna agar disk system secara keseluruhan tidak cepat full, dan fungsi dari *thin provision storage* atau storage yang bisa tetap thin sesuai file yang ada di vm, bukan berdasarkan disk yang dialokasikan.

Persyaratan adalah:

* menggunakan *thin provisioned backing storage* seperti qcow2, thin-lvm, zfs pada server proxmox nya
* menggunakan Virtio SCSI controller pada guest option vm nya
* Menggunakan SCSI bus/device saat pembuatan hdd pada guest vm nya dan check bagian discard option nya
* Tambahkan discard mount options di /etc/fstab nya guest vm
* Enable fstrim.timer pada systemctl

Adapun langkahnya, disini dilakukan perubahan pada VM yang sebelumnya telah terbuat dengan Virtio disk, dari disk yang kedua dari VM, agar lebih aman, dirubah satu persatu, dimulai dari disk kedua terlebih dahulu:

* edit dulu /etc/fstab bagian disk dari /dev/vdb1 menjadi /dev/sda1 (sda untuk drive scsi / sata, untuk lebih aman nya di komen dulu bagian disk /hdbck, untuk di mount manual, agar pada saat boot jika salah tidak nyangkut)
* shutdown vm
* detach disk
* edit disk, menjadi SCSI dan klik bagian advanced, lalu check discard
* start vm
* setelah login, jalankan fstrim -v /hdbck/

Note:

* Untuk perubahan selanjutnya pada disk yang pertama, di edit dulu /etc/fstab nya, misal /dev/vda1 menjadi /dev/sda1, dan /dev/sda1 sebelumnya yg disk kedua yg telah di edit menjadi SCSI menjadi /dev/sdb1, lalu baru lakukan seperti langkah diatas dari shutdown vm sampai jalankan fstrim.
* Masukan juga pada crontab, agar dijalankan fstrim setiap bulan, jika memakai centos 6 dan dibawahnya
* Untuk membuktikannya, sambil mengecek di server proxmox dengan menggunakan command `zfs list` jika memakai zfs, `lvs` atau `lvdisplay` untuk thin-lvm, atau `du -sch` jika memakai qcow2 untuk mengetahui besar file sebelum dan setelah di guest vm nya dijalankan command `fstrim -av`

Referensi:

* https://pve.proxmox.com/wiki/Shrink_Qcow2_Disk_Files
* https://kparal.wordpress.com/2017/10/06/automatically-shrink-your-vm-disk-images-when-you-delete-files/
