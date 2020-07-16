---
title: "Proxmox Add ZFS"
date: 2020-07-10T08:17:54+07:00
tags: ["linux", "server", "proxmox", "zfs"]
author: "Widya"
draft: false
---

## Proxmox Add ZFS

Referensi:

* https://holdmybeersecurity.com/2017/05/20/installsetup-proxmox-5-0/
* https://pve.proxmox.com/wiki/ZFS_on_Linux

## Proxmox cloud-init

Ref:

* https://cloud.centos.org/centos/7/images/
* https://pve.proxmox.com/wiki/Cloud-Init_Support
* https://stafwag.github.io/blog/blog/2019/03/03/howto-use-centos-cloud-images-with-cloud-init/

## upgrade proxmox 5 to 6
https://pve.proxmox.com/wiki/Upgrade_from_5.x_to_6.0
```
tmux
pve5to6
#make sure it's ok
systemctl stop pve-ha-lrm
systemctl stop pve-ha-crm
echo "deb http://download.proxmox.com/debian/corosync-3/ stretch main" > /etc/apt/sources.list.d/corosync3.list
apt update
apt dist-upgrade
systemctl start pve-ha-lrm
systemctl start pve-ha-crm
sed -i 's/stretch/buster/g' /etc/apt/sources.list
apt update
apt dist-upgrade
rm /etc/apt/sources.list.d/corosync3.list
```

