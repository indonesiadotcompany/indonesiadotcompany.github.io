---
title: "Selinux Web Directory Permission"
date: 2020-01-20T09:17:54+07:00
tags: ["linux", "selinux", "centos", "permission", "redhat"]
author: "Widya"
draft: false
---

## Selinux Web Directory Permission

Di linux centos / redhat biasanya kita berhadapan dengan selinux, dan kadang mengalami kendala seperti web directory yang di buat selain di /var/www/html, misal di /webserver itu tidak bisa di akses meski sudah diarahkan root location / document root ke /webserver.

adapun command nya sebelum bisa diakses yaitu:

```
chcon -Rv --type=httpd_sys_rw_content_t /webserver
```

Referensi:

* https://www.svnlabs.com/blogs/centos-7-selinux-apache-php-writeaccess-permission/

