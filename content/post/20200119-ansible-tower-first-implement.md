---
title: "Ansible Tower first Implementation"
date: 2020-01-19T15:17:54+07:00
tags: ["linux", "ansible", "tower", "ansibletower"]
author: "Widya"
draft: false
---

## Ansible Tower first Implementation

* Install ansible tower
* masukan license
* tambahkan **access - organization**
* tambahkan **access - users**
* tambahkan **access - teams**
* tambahkan **resources - inventory**
* siapkan script playbook / roles (jika berupa folder, itu ditaruh di /var/lib/awx/projects, jika git, pastikan bisa di akses)
* tambahkan **resources - projects**
* buat ssh-keygen di server ansible tower, buat user khusus ansible, dan masukan di /etc/sudoers, lalu ssh-copy-id ke tiap node / client sesuai user yg baru dibuat / didefine
* tambahkan **resources - credentials**
* tambahkan **resources - templates**
* test launch jobs based on template yg baru dibuat

Referensi:

* https://indonesiadot.com

