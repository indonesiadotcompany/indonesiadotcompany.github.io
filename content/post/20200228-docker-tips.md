---
title: "Docker Tips"
date: 2020-02-28T08:07:54+07:00
tags: ["docker", "container", "tips"]
author: "Widya"
draft: false
---

## Docker run example
```
docker run -it alpine /bin/ash
```
Where -i = interactive, -t make tty for the running process, /bin/ash is the command to run.

docker run --help

## How to get ip of running docker
```
docker ps
docker inspect <containernameorid>
docker inspect <containernameorid> | grep '"IPAddress"' | head -n 1
```
Where head is opossite from tail, man head, man tail

* https://stackoverflow.com/questions/43692961/how-to-get-ip-address-of-running-docker-container/47226863#:~:text=Usually%2C%20the%20default%20docker%20ip,first%20container%20should%20be%20172.17.


