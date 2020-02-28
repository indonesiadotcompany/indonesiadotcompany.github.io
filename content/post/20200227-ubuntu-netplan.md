---
title: "Ubuntu networking using netplan"
date: 2020-02-27T08:17:54+07:00
tags: ["linux", "server", "ubuntu", "netplan", "networking"]
author: "Widya"
draft: false
---

# Ubuntu networking using netplan

## Configuration
To configure netplan, save configuration files under /etc/netplan/ with a .yaml extension (e.g. /etc/netplan/config.yaml), then run sudo netplan apply. This command parses and applies the configuration to the system. Configuration written to disk under /etc/netplan/ will persist between reboots.

## Using DHCP and static addressing
To let the interface named ‘enp3s0’ get an address via DHCP, create a YAML file with the following:
```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
      dhcp4: true
```

To instead set a static IP address, use the addresses key, which takes a list of (IPv4 or IPv6), addresses along with the subnet prefix length (e.g. /24). Gateway and DNS information can be provided as well:
```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
      addresses:
        - 10.10.10.2/24
      gateway4: 10.10.10.1
      nameservers:
          search: [mydomain, otherdomain]
          addresses: [10.10.10.1, 1.1.1.1]
```

## Connecting multiple interfaces with DHCP
Many systems now include more than one network interface. Servers will commonly need to connect to multiple networks, and may require that traffic to the Internet goes through a specific interface despite all of them providing a valid gateway.

One can achieve the exact routing desired over DHCP by specifying a metric for the routes retrieved over DHCP, which will ensure some routes are preferred over others. In this example, ‘enred’ is preferred over ‘engreen’, as it has a lower route metric:
```
network:
  version: 2
  ethernets:
    enred:
      dhcp4: yes
      dhcp4-overrides:
        route-metric: 100
    engreen:
      dhcp4: yes
      dhcp4-overrides:
        route-metric: 200
```

## Connecting to an open wireless network
Netplan easily supports connecting to an open wireless network (one that is not secured by a password), only requiring that the access point is defined:
```
network:
  version: 2
  wifis:
    wl0:
      access-points:
        opennetwork: {}
      dhcp4: yes
```

## Connecting to a WPA Personal wireless network
Wireless devices use the ‘wifis’ key and share the same configuration options with wired ethernet devices. The wireless access point name and password should also be specified:
```
network:
  version: 2
  renderer: networkd
  wifis:
    wlp2s0b1:
      dhcp4: no
      dhcp6: no
      addresses: [192.168.0.21/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1, 8.8.8.8]
      access-points:
        "network_ssid_name":
          password: "**********"
```

## Using multiple addresses on a single interface
The addresses key can take a list of addresses to assign to an interface:
```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
     addresses:
       - 10.100.1.38/24
       - 10.100.1.39/24
     gateway4: 10.100.1.1
```
Interface aliases (e.g. eth0:0) are not supported.

Referensi:

* https://netplan.io/examples

