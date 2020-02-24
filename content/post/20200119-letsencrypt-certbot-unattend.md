---
title: "Letsencrypt certbot unatteded"
date: 2020-01-19T08:17:54+07:00
tags: ["linux", "server", "letsencrypt", "https", "ssl", "certbot"]
author: "Widya"
draft: false
---

## Letsencrypt with certbot unatteded way

This is for ubuntu linux
```
add-apt-repository ppa:certbot/certbot -y
apt install certbot -y
certbot certonly --standalone --preferred-challenges http --non-interactive  --staple-ocsp --agree-tos -m widyaunix@gmail.com -d harbor.example.com
```

## Note:

* before running certbot command, you must already pointing domain / subdomain address to destination ip

## Referensi:

* https://indonesiadot.com

