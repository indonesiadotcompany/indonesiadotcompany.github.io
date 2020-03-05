---
title: "Netcat Bandwidth Test"
date: 2020-03-05T18:17:54+07:00
tags: ["linux", "netcat", "bandwidth", "tips"]
author: "Widya"
draft: false
---

## Netcat Bandwidth Test

### netcat-server
```
nc -l -p 12345 | wc -c
```

### netcat-client
```
dd if=/dev/zero bs=$((2**20)) count=$((2**10)) | nc -q 0 netcat-server 12345
#or
dd if=/dev/zero bs=1024k count=300 | nc netcat-server 12345
```

on the server run nload to see the bandwidth used at eth0 for incoming and outgoing

Referensi:

* https://blog.bjdean.id.au/2017/03/bandwidth-measurement-using-netcat/
* https://www.thegeekstuff.com/2012/04/nc-command-examples/

