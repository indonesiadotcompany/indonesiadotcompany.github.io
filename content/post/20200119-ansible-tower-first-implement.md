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
```
chmod g+s /var/lib/awx/projects
cp -r test /var/lib/awx/projects/
```
* tambahkan **resources - projects**
* buat ssh-keygen di server ansible tower, buat user khusus ansible, dan masukan di /etc/sudoers, lalu ssh-copy-id ke tiap node / client sesuai user yg baru dibuat / didefine
* buat host client / node yang mau di manage di /etc/hosts
* tambahkan **resources - credentials**
* tambahkan **resources - templates**
* test launch jobs based on template yg baru dibuat

## Ansible tower + openscap

* install scap-workbench
```
yum install scap-workbench xauth -y
```
* buat direktori report
```
mkdir /report                                                                                                                                                                                               
chgrp awx /report                                                                                                                                                                                           
chmod g+s /report/
chcon -Rv --type=httpd_sys_rw_content_t /report/
ln -s /report /var/lib/awx/public/
```
* tambahkan direktori report di nginx
```
        location /report {
                alias /var/lib/awx/public/report;
                autoindex on;
        }
```
* akses scap-workbench dari laptop
```
ssh -X -C tower1
scap-workbench
```
* jalankan **Scan** Remote Machine (over SSH) ke ansible@client1 (jika muncul popup, pilih centos7)
* Save generate result html ke /report (tambahkan pembeda semisal datetime untuk membedakan tiap file report)

Referensi:

* https://indonesiadot.com

