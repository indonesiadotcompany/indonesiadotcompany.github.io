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


Ref:

* https://docs.docker.com/engine/security/certificates/
* https://docs.docker.com/engine/security/https/
* https://stackoverflow.com/questions/43692961/how-to-get-ip-address-of-running-docker-container
* https://rancher.com/swarm/
* https://github.com/MoimHossain/docker-viswarm
* https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host

## docker with sshd
https://gist.github.com/widyaunix/580dd6bbed4754631659317d4b1e8344

Create Dockerfile
```
FROM centos

RUN yum -y install openssh-server
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -A
RUN echo 'root:r4hasia' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ADD id_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
```

Then build to image using this command:
```
docker build -t centossh ./
docker images
```
WARNING: docker ssh considered evil

https://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/

## docker with static ip
```
docker network create --subnet=172.1.0.0/24 docnet
docker run --name centos810 --net docnet --ip 172.1.0.10 --rm -d centossh
```
