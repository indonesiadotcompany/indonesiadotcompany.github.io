---
title: "Postfix tips"
date: 2019-09-02T08:17:54+07:00
tags: ["mail", "postfix", "tips"]
author: "Widya"
draft: false
---

### postfix send to local network

Ini adalah langkah untuk membuat postfix mengirim ke mail server dalam LAN

```
echo "real.net smtp:[192.168.1.108]" >> /etc/postfix/transport
postmap /etc/postfix/transport
systemctl restart postfix
```

Referensi:

* https://www.linuxquestions.org/questions/linux-server-73/how-to-make-postfix-send-email-to-another-postfix-in-local-network-lan-694423/
* http://www.postfix.org/STANDARD_CONFIGURATION_README.html

