---
title: "Ansible Reference"
date: 2019-10-28T08:17:54+07:00
tags: ["linux", "ansible", "reference", "tips"]
author: "Widya"
draft: true
---

## Ansible check disk
```
- name: Ensure that free space on {{ mountname }} is grater than 40%
  assert:
    that: mount.size_available > mount.size_total|float * 0.4
    msg: disk space has reached 60% threshold
  vars:
    mountname: '/'
    mount: "{{ ansible_mounts | selectattr('mount','equalto',mountname) | list | first }}"
```
atau
```
- name: Ensure that free space on the tested volume is greater than 15%
  assert:
    that:
      - mount.size_available > mount.size_total|float * 0.15
    msg: Disk space has reached 85% threshold
  vars:
    mount: "{{ ansible_mounts | selectattr('mount','equalto',item.mount) | list | first }}"
  with_items:
    - "{{ ansible_mounts }}"
```
atau
```
name: 'Ensure that free space on {{ mountname }} is grater than 30%'
assert:
  that: item.size_available > item.size_total|float * 0.3
  msg: 'disk space has reached 70% threshold'
when: item.mount == mountname
with_items: '{{ ansible_mounts }}'
```
Referensi:

* https://stackoverflow.com/questions/44077630/ansible-to-check-diskspace-for-mounts-mentioned-as-variable

## Ansible role tutorial

Referensi:

* https://medium.com/@brad.simonin/learning-ansible-and-ansible-roles-with-centos-7-linux-817406f7b542

## Ansible create file based on date

```
- name: Backup and compress /etc/ to /data/backups based on date
  archive:
    path: /etc/
    dest: /data/backups/etc-{{ date }}.tgz
  vars:
    date: "{{ lookup('pipe', 'date +%Y%m%d-%H%M') }}"
```

Referensi:

* https://serverfault.com/questions/728662/ansible-manipulate-file-with-a-date-format

