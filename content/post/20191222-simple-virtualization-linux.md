---
title: "Simple Virtualization Linux"
date: 2019-12-22T08:17:54+07:00
tags: ["linux", "server", "tips", "virtualization", "kvm", "qemu", "virt-install"]
author: "Widya"
draft: false
---

## List kvm using virsh
```
virsh list
virsh list --all
virsh --help
```

## Create vm on kvm / qemu via libvirt with command line

### Pembuatan vm centos 7

script bash virtcen.sh

```
#!/bin/bash

NAMA=$1

if [ -z "$1" ]; then
 while [ -z "$NAMA" ]; do
  echo -n "masukan nama vm: "
  read NAMA
 done
fi

virt-install \
 --name $NAMA \
 --ram 900 \
 --disk path=$NAMA.qcow,size=6,bus=scsi,discard='unmap',format='qcow2' \
 --controller type=scsi,model=virtio-scsi \
 --vcpus 1 \
 --cpu host \
 --console pty,target_type=serial \
 --location /iso/CentOS-7.0-1406-x86_64-Minimal.iso \
 --initrd-inject=cenks.cfg --extra-args "inst.ks=file:/cenks.cfg" \
 --noautoconsole
```

file kickstart cenks.cfg
```
text
install

ignoredisk --only-use=sda
clearpart --all
autopart
bootloader --location=mbr --driveorder=sda

rootpw --iscrypted $1$R69aiGHP$BmqNaQ1ckncOT0I3t6DlN1
user widysible --name widysible --iscrypted --password $1$u08OmYWr$s3v/lOnNMVyb5SCEwFFLG1

timezone Asia/Jakarta
network --bootproto=dhcp

firewall --disabled
#reboot --eject
shutdown

%packages
@Core
%end
%post --interpreter=/bin/bash
#exec < /dev/tty6 > /dev/tty6
#chvt 6
echo ### Add public ssh key for Ansible
mkdir -m0700 -p /home/widysible/.ssh
cat <<EOF >/home/widysible/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTIv6ziCUfRwMfGGVwZoKtWLf51+OLzDwwQYXyrf8vmnY7tZB7GLWAWCmto2nsNfwBQiXBXWZ7rUfTM2og/xfTerrDexyBg1Polm0FAK9zNwDE77WqSeirCQFAQ0Q+GaJaERitrF5h+SfDBHIgoMEuWJMzCQvzaI/3WU2YB//LzcM3NckfxolxQbjMzPNweVZ6BpEOGB7a9BQh370+EFj8h9suOVPYmqV5L5M0gMrYiQ7qA2Zzf442g5AElJqU7p8EFUI4ttLnP8AlkxQvRQOWRcf11iQDAbJNF7UDh0iqYOe0cynnMUZQp1nmQD5t65L8tHp0k94P3bdN7FHvbjBL root@wid
EOF
chown -R widysible:widysible /home/ansible
chmod 0600 /home/widysible/.ssh/authorized_keys
# Allow Ansible to sudo w/o a password
echo "widysible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/widysible
# trim
sed -i 's/issue_discards = 0/issue_discards = 1/' /etc/lvm/lvm.conf
echo "0 0 1 0 0 fstrim /" | tee /etc/cron.d/fstrim
sed -i '/ swap /s/^/#/' /etc/fstab
sed -i 's/defaults/defaults,discard/' /etc/fstab
echo ### Change back to terminal 1
#chvt 1
%end

```

Create VM using ansible playbook
```
---
- name: create VMs
  hosts: localhost
  gather_facts: no
  connection: local
  become: true
  vars_prompt:
    - name: NAMA
      prompt: "Enter VM name"
      default: "c7"
      private: no
#  vars_files:
#    - vms.yml

  tasks:
    - name: get VM disks
      command: "ls /var/lib/libvirt/images"
      register: disks
      changed_when: "disks.rc != 0"

    - name: get list of VMs
      virt:
        command: "list_vms"
      register: vms

    - name: create vm
      command: >
                virt-install --name {{ NAMA }}
                --cpu host --vcpus 1 --ram 900
                --disk path=$NAMA.qcow,size=6,bus=scsi,discard='unmap',format='qcow2'
                --controller type=scsi,model=virtio-scsi
                --console pty,target_type=serial
                --location /iso/CentOS-7.0-1406-x86_64-Minimal.iso
                --initrd-inject=cenks.cfg --extra-args "inst.ks=file:/cenks.cfg"
                --noautoconsole
```

## Get VMs IP
```
virsh domifaddr c7
```

Referensi:

* https://www.srv24x7.com/kickstart-install-centos-7-using-virt-install/
* https://www.cyberciti.biz/faq/how-to-install-kvm-on-centos-7-rhel-7-headless-server/
* http://blog.leifmadsen.com/blog/2016/12/16/creating-virtual-machines-in-libvirt-with-virt-install/
* http://kvmonz.blogspot.com/p/knowledge-use-virt-install-for-kvm.html
* https://earlruby.org/2018/12/use-iso-and-kickstart-files-to-automatically-create-vms/
* https://graspingtech.com/creating-virtual-machine-virt-install/
* https://www.server-world.info/en/note?os=Ubuntu_18.04&p=kvm&f=2
* http://blog.zencoffee.org/2016/06/easy-headless-kvm-deployment-virt-install/
* https://gist.github.com/aladuca/854b78585c2bba961386
* https://www.cyberciti.biz/faq/find-ip-address-of-linux-kvm-guest-virtual-machine/
* https://www.cyberciti.biz/faq/linux-list-a-kvm-vm-guest-using-virsh-command/
* https://hooks.technology/2017/10/create-vms-on-kvm-with-ansible/ (virt-builder and virt-install)
