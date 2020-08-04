---
title: "iptables tips"
date: 2020-07-08T08:17:54+07:00
tags: ["linux", "iptables", "tips"]
author: "Widya"
draft: false
---

iptables adalah program utility untuk seting firewall di linux.

## Flush All Rules, Delete All Chains, and Accept All
* https://www.digitalocean.com/community/tutorials/how-to-list-and-delete-iptables-firewall-rules

This section will show you how to flush all of your firewall rules, tables, and chains, and allow all network traffic.

Note: This will effectively disable your firewall. You should only follow this section if you want to start over the configuration of your firewall.

First, set the default policies for each of the built-in chains to ACCEPT. The main reason to do this is to ensure that you won’t be locked out from your server:
```
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
```
Then flush the nat and mangle tables, flush all chains (-F), and delete all non-default chains (-X):
```
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X
```
Your firewall will now allow all network traffic. If you list your rules now, you will will see there are none, and only the three default chains (INPUT, FORWARD, and OUTPUT) remain.


