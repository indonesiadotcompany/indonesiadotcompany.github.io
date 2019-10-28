---
title: "Belajar Ansible Tower"
date: 2019-10-10T07:09:53+07:00
tags: ["linux", "ansible", "ansibletower", "postgresql", "rabbitmq"]
author: "Widya"
draft: false
---

## Install Ansible Tower
Persyaratan:

Hardware: RAM minimal 3,75 GB
OS: Centos 7

Langkah yang dilakukan
```
yum install -y ansible
wget http://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.1.5.tar.gz
tar -xzvf ansible-tower-setup-3.1.5.tar.gz
cd ansible-tower-setup-3.1.5/
(edit inventory file, isi bagian yang dibutuhkan terutama password)
(edit roles/preflight/defaults/main.yml, jika ingin menurunkan minimal ram)
./setup.sh
```

## Configure Ansible Tower after installation
Akses Ansible tower Web UI dari 
```
https://<Ansible Tower IP or Hostname>
```
Dapatkan lisensi dari https://www.ansible.com/license
lalu masukkan license tersebut ke halaman awal setelah login

Referensi:

* https://www.ansible.com/products/tower/trial
* https://docs.ansible.com/ansible-tower/
* http://devopstechie.com/install-and-configure-ansible-tower-centos7/
* https://www.google.com/search?q=ansible+tower+postgresql+replication
* https://servicesblog.redhat.com/2019/04/08/ansible-tower-high-availability-and-disaster-recovery/
* https://github.com/samdoran/ansible-role-pgsql-replication

