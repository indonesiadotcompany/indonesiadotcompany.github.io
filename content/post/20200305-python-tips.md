---
title: "Python Tips"
date: 2020-03-05T08:17:54+07:00
tags: ["linux", "python", "tips"]
author: "Widya"
draft: false
---

## module python web server
```
python -m SimpleHTTPServer 8001
python -m SimpleHTTPServer 8002
```

* https://stackoverflow.com/questions/7943751/what-is-the-python-3-equivalent-of-python-m-simplehttpserver
* https://www.pcsuggest.com/best-lightweight-web-server-linux/

## multiple python version on centos 6
https://stackoverflow.com/questions/20842732/libpython2-7-so-1-0-cannot-open-shared-object-file-no-such-file-or-directory
https://www.2daygeek.com/install-python-3-on-centos-6/
```
yum install centos-release-scl -y
yum --enablerepo='centos-sclo-rh' install python27-python -y
echo "/opt/rh/python27/root/usr/lib64" >> /etc/ld.so.conf
ldconfig
/opt/rh/python27/root/usr/bin/python --version
yum --enablerepo='centos-sclo-rh' install rh-python36-python
/opt/rh/rh-python36/root/usr/bin/python --version
```
