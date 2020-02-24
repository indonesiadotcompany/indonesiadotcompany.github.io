---
title: "Selinux semanage"
date: 2019-12-23T08:17:54+07:00
tags: ["linux", "server", "tips", "centos", "rhel", "selinux", "semanage"]
author: "Widya"
draft: false
---

content of selinux config /etc/selinux/config
```
SELINUX=enforcing
SELINUXTYPE=targeted 
```

## semanage packages
```
yum provides semanage
yum install -y policycoreutils-python
```

## semanage list port
```
semanage port -l | grep ssh
```

## semanage open ssh on different port
add ssh port 1022 at /etc/ssh/sshd_config, and before restart sshd service, add selinux config for new ssh port

```
semanage port -a -t ssh_port_t -p tcp 1022
```
then restart sshd service
```
systemctl restart sshd
```

Referensi:

* https://sharadchhetri.com/2014/10/15/centos-7-rhel-7-change-openssh-port-number-selinux-enabled/

