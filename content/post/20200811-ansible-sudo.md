---
title: "Ansible sudoers"
date: 2020-08-11T08:17:54+07:00
tags: ["linux", "ansible", "playbook", "sudo"]
author: "Widya"
draft: false
---

## Contoh
* https://code-maven.com/enable-ansible-passwordless-sudo
* https://stackoverflow.com/questions/37333305/ansible-create-a-user-with-sudo-privileges
```
- hosts: all
  tasks:
    - lineinfile:
        path: /etc/sudoers
        state: present
        regexp: '^%sudo'
        line: '%sudo ALL=(ALL) NOPASSWD: ALL'
        validate: 'visudo -cf %s'
```
contoh lain
```
- name: Make sure we have a 'wheel' group
  group:
    name: wheel
    state: present

- name: Allow 'wheel' group to have passwordless sudo
  lineinfile:
    dest: /etc/sudoers
    state: present
    regexp: '^%wheel'
    line: '%wheel ALL=(ALL) NOPASSWD: ALL'
    validate: 'visudo -cf %s'

- name: Add sudoers users to wheel group
  user:
    name=deployer
    groups=wheel
    append=yes
    state=present
    createhome=yes

- name: Set up authorized keys for the deployer user
  authorized_key: user=deployer key="{{item}}"
  with_file:
    - /home/railsdev/.ssh/id_rsa.pub
```


