---
title: "All about kubernetes"
date: 2019-09-02T08:17:33+07:00
show_reading_time: true
tags: ["kubernetes", "container", "docker"]
author: "Widya"
draft: false
---

## Kubernetes Container runtime with docker

```
# Install Docker CE
## Set up the repository
### Install required packages.
yum install yum-utils device-mapper-persistent-data lvm2

### Add Docker repository.
yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

## Install Docker CE.
yum update && yum install docker-ce-18.06.2.ce

## Create /etc/docker directory.
mkdir /etc/docker

# Setup daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Restart Docker
systemctl daemon-reload
systemctl restart docker
```

Ref:

* https://kubernetes.io/docs/setup/production-environment/container-runtimes/

Referensi:

* https://darxkies.github.io/k8s-tew/_build/html/index.html

