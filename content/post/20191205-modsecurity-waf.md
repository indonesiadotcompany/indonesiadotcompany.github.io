---
title: "Modsecurity WAF"
date: 2019-12-05T08:17:54+07:00
tags: ["linux", "server", "security", "modsecurity", "webserver", "waf"]
author: "Widya"
draft: false
---

## Modsecurity WAF

![routed-lans](/images/2019/modsecurity-architecture.jpg)

user yg mau sql injection di scan dulu sama modsecurity yg modsecurity baca ruleset (crs) kalau ada di rules nya di deny.
kalau false positive, dinyatakan oleh client / developer bahwa itu sbnrnya aman, baru di exclude rule tersebut, kalau developer bisa nambel supaya bisa rubah supaya lebih sesuai ruleset nya lebih baik.

intinya mudah sih yg opensource, cuma kelemahan nya nempel di host dan atau nempel di webserver, lalu kelemahan lain banyak false positive, sama ga ada ui nya, meski berjalan bagus bisa menahan serangan cuma agak sulit manage nya, terutama klo aplikasi yg ga standar, klo yg standar misal kaya wordpress mungkin lebih mudah.

Referensi:

* Searching modsecurity architecture

