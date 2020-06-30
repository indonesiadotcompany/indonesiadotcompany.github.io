---
title: "Harbor Container Registry"
date: 2020-01-20T07:17:54+07:00
tags: ["linux", "harbor", "container", "registry", "docker"]
author: "Widya"
draft: false
---

## harbor install step by step
https://goharbor.io/docs/1.10/install-config/

* install docker, docker-compose
* download https://github.com/goharbor/harbor/releases 
* edit harbor.yml
```
hostname: 10.11.8.111
```
* install
```
./prepare
./install.sh --with-clair --with-chartmuseum
```
* create projects dengan nama os (misalnya untuk menampung operating system)

## harbor client push
* edit /etc/docker/daemon.json
```
{ "insecure-registries":["10.11.8.111"] }
```
* systemctl restart docker (hati2 jika ada container yg berjalan akan di stop)
* docker login 10.11.8.111
* docker tag centos:7 10.11.8.111/os/centos:7
* docker push 10.11.8.111/os/centos:7

## Widya Harbor Container Registry

* https://widharbor.birau.com/

Referensi:

* https://indonesiadot.com

