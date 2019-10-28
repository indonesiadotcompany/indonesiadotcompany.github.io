---
title: "Create GCP VM using gcloud from command line"
date: 2019-10-25T18:17:42+07:00
show_reading_time: true
tags: ["cloud", "gcp", "google-cloud-platform", "google", "gcloud", "command", "bash", "script"]
author: "Widya"
draft: false
---

Pembuatan virtual machine di GCP / Google Cloud Platform menggunakan gcloud command line bermanfaat untuk mempermudah pembuatan VM tanpa harus mengakses web browser.

Berikut langkah nya yang dilakukan di OS Centos 7:
```
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo yum install google-cloud-sdk
gcloud init
```
Berikut langkah yang dilakukan di OS ubuntu / debian:
```
echo "deb http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
```
Pada saat initialize ini akan diminta untuk memasukan user google yang akan digunakan, diikuti saja semua langkah nya sampai dengan memasukan verifikasi.

Setelah itu bisa menjalankan script 1-gcp-centos.sh berikut:
```
bash 1-gcp-centos.sh namavm
```
Berikut script 1-gcp-centos.sh
```
#!/bin/bash

if [ -z "$1" ]; then
 NAMA=$1
 while [ -z "$NAMA" ]; do
  echo "masukan nama vm:"
  read NAMA
 done
 # Create GCE VM with disk storage
 gcloud compute instances create $NAMA \
  --machine-type f1-micro \
  --network default \
  --subnet default \
  --network-tier PREMIUM \
  --maintenance-policy MIGRATE \
  --scopes https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --image centos-7-v20191014 \
  --image-project centos-cloud \
  --boot-disk-size 10GB \
  --boot-disk-type pd-standard \
  --boot-disk-device-name compute-disk
fi
```

Referensi:

* https://cloud.google.com/sdk/docs/quickstart-redhat-centos
* https://github.com/garystafford/ansible-gcp-demo
