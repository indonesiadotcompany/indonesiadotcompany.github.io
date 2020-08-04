---
title: "Jfrog for Beginner"
date: 2020-08-04T17:17:54+07:00
tags: ["linux", "jfrog", "repository", "artifactory", "artifacts"]
author: "Widya"
draft: false
---

## Install jfrog di ubuntu
https://websiteforstudents.com/how-to-install-jfrog-artifactory-on-ubuntu-18-04-16-04/
```
apt install wget software-properties-common apt-transport-https
apt-get install openjdk-8-jdk openjdk-8-doc
wget -qO - https://api.bintray.com/orgs/jfrog/keys/gpg/public.key | apt-key add -
add-apt-repository "deb [arch=amd64] https://jfrog.bintray.com/artifactory-debs $(lsb_release -cs) main"
apt-get update
apt install jfrog-artifactory-oss
```

## Membuat repository / artifacts baru di jfrog
```
klik menu administration, lalu klik menu repositories (sebelah kiri), lalu klik + New Local Repository (sebelah kanan)
klik / pilih generic, lalu isi repository key atau nama repository dengan apa saja yg diinginkan misal ansible-test-report
klik save
```

## test upload dan download via curl
buat dahulu bbrp file, misal test.txt, lalu upload dengan command curl
```
curl -uadmin:r4hasia01 -T test.txt "http://10.11.8.41:8081/artifactory/ansible-test-report/test.txt"
```
command untuk download memakai curl
```
curl -uadmin:r4hasia01 -O "http://10.11.8.41:8081/artifactory/ansible-test-report/test.txt"
```

## test upload dengan playbook script
buat file jfrog-upload.yml
```
- hosts: all
  gather_facts: false
  connection: local
  tasks:
    - uri:
        url: 'http://10.11.8.41:8081/artifactory/generic/test1.txt'
        src: ./test1.txt
        method: PUT
        return_content: true
        user: admin
        password: r4hasia01
        force_basic_auth: true
        status_code: 201
        headers:
          Content-Type: application/octet-stream
          Accept: application/json
```
buat file test1.txt, lalu jalankan script playbooknya dengan:
```
ansible-playbook -i localhost, jfrog-upload.yml
```
## Jfrog CLI
* https://jfrog.com/getcli/
* https://www.jfrog.com/confluence/display/CLI/CLI+for+JFrog+Artifactory

untuk lebih memudahkan proses management jfrog bisa menggunakan jfrog cli

bisa download dulu dengan command:
```
curl -fL https://getcli.jfrog.io | sh
```
configure jfrog cli dengan
```
./jfrog rt c jfroglan --url=http://10.11.8.41:8082/artifactory --user=admin --password=r4hasia01
```
dari sini bisa untuk delete file / direktori, misal delete file testdir yg sebelumnya terbuat, dengan command:
```
./jfrog rt del generic/testdir
```
upload semua file di direktori dan taruh di direktori juga
```
./jfrog rt u "testdir/" generic/testdir/
```

