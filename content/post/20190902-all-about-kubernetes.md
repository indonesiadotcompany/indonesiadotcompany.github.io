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
```
systemctl daemon-reload
systemctl restart docker
```

* https://kubernetes.io/docs/setup/production-environment/container-runtimes/

## kubernetes master
```
hostnamectl set-hostname master-node
cat <<EOF>> /etc/hosts
10.128.0.27 master-node
10.128.0.29 node-1 worker-node-1
10.128.0.30 node-2 worker-node-2
EOF
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=2379-2380/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10251/tcp
firewall-cmd --permanent --add-port=10252/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd –reload

modprobe br_netfilter
cat <<EOF>> /etc/sysctl.d/100-kube.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install kubeadm
systemctl enable kubelet
systemctl start kubelet

swapoff -a

kubeadm init --apiserver-advertise-address=192.168.122.42 --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
# cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get nodes
```

## kubernetes node

```
hostnamectl set-hostname 'node-1'
cat <<EOF>> /etc/hosts
10.128.0.27 master-node
10.128.0.29 node-1 worker-node-1
10.128.0.30 node-2 worker-node-2
EOF

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

firewall-cmd --permanent --add-port=6783/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd  --reload

cat <<EOF>> /etc/sysctl.d/100-kube.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install kubeadm
systemctl enable kubelet
systemctl start kubelet
```

We now require the token that kubeadm init generated, to join the cluster. You can copy and paste it to your node-1 and node-2 if you had copied it somewhere.
```
kubeadm join 10.128.0.27:6443 --token nu06lu.xrsux0ss0ixtnms5  --discovery-token-ca-cert-hash sha256:f996ea3564e6a07fdea2997a1cf8caeddafd6d4360d606dbc82314688425cd41 
```

## kubernetes master
```
kubectl get nodes
```

* https://www.tecmint.com/install-kubernetes-cluster-on-centos-7/
* https://www.howtoforge.com/tutorial/centos-kubernetes-docker-cluster/

## kubernetes kubeadm show join command

```
kubeadm token create --print-join-command
```

## kubernetes delete node
```
kubectl get nodes
kubectl drain <namanode>
kubectl delete node <namanode>
```
at the node, then type:
```
kubeadm reset
```

* https://stackoverflow.com/questions/35757620/how-to-gracefully-remove-a-node-from-kubernetes


