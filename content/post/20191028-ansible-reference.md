---
title: "Ansible Reference"
date: 2019-10-28T08:17:54+07:00
tags: ["linux", "ansible", "reference", "tips"]
author: "Widya"
draft: false
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

## Ansible check file if exists or not

```
- name: Check that the hosts.allow exists
  stat:
    path: /etc/hosts.allow
  register: stat_allow
- name: Create the file, if it doesnt exist already
  file:
    path: /etc/hosts.allow
    state: touch
  when: stat_allow.stat.exists == False
```

Ref:

* https://stackoverflow.com/questions/35654286/how-check-a-file-exists-in-ansible

## Ansible explicit data type casting !!str indicator

!!str indicator which simply forces the value to be a string.

Ref:

* https://github.com/ansible/ansible/issues/11905
* https://github.com/ansible/ansible/issues/11151

## Ansible lineinfile module

Ref:

* https://docs.ansible.com/ansible/latest/modules/lineinfile_module.html

## Ansible find, register variable, and output to terminal / echo

Ref:

* https://www.mydailytutorials.com/ansible-register-variables/
* https://serverfault.com/questions/537060/how-to-see-stdout-of-ansible-commands
* https://docs.ansible.com/ansible/latest/modules/debug_module.html
* https://docs.ansible.com/ansible/latest/modules/find_module.html
* https://serverfault.com/questions/945821/ansible-find-get-path-of-a-directory

## Ansible show detailed output using callback plugins

Ref:

* https://docs.ansible.com/ansible/latest/plugins/callback.html
* https://docs.ansible.com/ansible/latest/plugins/callback/profile_tasks.html

