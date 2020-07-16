---
title: "Proxmox Beginner"
date: 2020-07-10T08:17:54+07:00
tags: ["linux", "proxmox", "tips", "beginner"]
author: "Widya"
draft: false
---

## update proxmox repo
https://pve.proxmox.com/wiki/Package_Repositories
untuk bisa update proxmox harus dirubah dulu repo nya di file /etc/apt/sources.list (untuk proxmox 5.4 / debian 9 / stretch)
```
deb http://kebo.pens.ac.id/debian stretch main contrib
deb http://kebo.pens.ac.id/debian stretch-updates main contrib
# security updates
deb http://kebo.pens.ac.id/debian-security stretch/updates main contrib
deb http://download.proxmox.com/debian/pve stretch pve-no-subscription
```

## proxmox masquerade
https://pve.proxmox.com/wiki/Network_Configuration#_masquerading_nat_with_tt_span_class_monospaced_iptables_span_tt
```
auto lo
iface lo inet loopback
auto ens192
iface ens192 inet static
        address  10.11.8.202
        netmask  255.255.255.0
        gateway  10.11.8.1
auto vmbr0
iface vmbr0 inet static
        address  192.168.10.1
        netmask  255.255.255.0
        bridge-ports none
        bridge-stp off
        bridge-fd 0

        post-up echo 1 > /proc/sys/net/ipv4/ip_forward
        post-up iptables -t nat -A POSTROUTING -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING eno1 -j MASQUERADE
```

Referensi:

* https://indonesiadot.com

