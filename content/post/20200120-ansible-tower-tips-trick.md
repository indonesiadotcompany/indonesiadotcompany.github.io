---
title: "Ansible Tower tips and trick"
date: 2020-02-20T08:17:54+07:00
tags: ["linux", "harbor", "container", "registry", "docker"]
author: "Widya"
draft: false
---

## Ansible Tower tips and trick

### Change admin password
```
awx-manage changepassword admin
```

### backup and restore

* https://docs.ansible.com/ansible-tower/latest/html/administration/backup_restore.html

Referensi:

* https://docs.ansible.com/ansible-tower/latest/html/administration/tipsandtricks.html
* https://mohitepramod.wordpress.com/2019/01/19/ansible-tower-installation/

## Offline ansible tower bundle
* https://www.ansiblejunky.com/blog/create-complete-offline-ansible-tower-bundle/

```
wget https://releases.ansible.com/ansible-tower/setup-bundle/ansible-tower-setup-bundle-3.7.2-1.tar.gz
tar xzf ansible-tower-setup-bundle-3.7.2-1.tar.gz
cd ansible-tower-setup-bundle-3.7.2-1
```
edit inventory
```
yum install yum-utils
yum install createrepo
mkdir bundle/el7/repos/others
cd bundle/el7/repos/others
cat ../../base_packages.txt | xargs yumdownloader
createrepo .
cat << EOF >> ~/ansible-tower-setup-bundle-3.7.2-1/roles/repos_el/templates/tower_bundle_el7.j2

[others]
name=Others
baseurl=file://{{ bundle_install_folder }}/others
enabled=1
gpgcheck=0
EOF
```
setelah selesai, lalu re-package the bundle

note:
* ada bbrp paket yg dibutuhkan sebelum menjalankan setup.sh, paket ini bisa didapatkan dengan menginstall terlebih dahulu

## ansible tower ldap linux
* https://www.youtube.com/watch?v=E0QpSwXot68

1. install openldap-servers on centos (available at this blog)
2. configure ansible tower to add authentication to ldap server as describe on the video


