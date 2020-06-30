---
title: "Ansible postgresql"
date: 2020-06-30T12:17:54+07:00
tags: ["linux", "ansible", "postgresql", "tips"]
author: "Widya"
draft: false
---

## Requirements
```
pip install psycopg2-binary
```

## playbooks
cat psql.yml
```
- hosts: localhost
  become: yes
  gather_facts: no
  connection: local

  tasks:
  - name: Simple select query to acme db
    postgresql_query:
     db: pgtower
     login_user: pgtower
     login_password: pgtower
     query: SELECT version()
    register: result

  - debug:
      var: result
```
cat psqlgraf.yml
```
- hosts: localhost
  become: yes
  gather_facts: no
  connection: local

  tasks:
  - name: Simple select query to acme db
    postgresql_query:
     db: montower
     login_host: 10.11.8.13
     login_user: ansible
     login_password: r4hasia
     query: SELECT * from hosts
    register: result

  - debug:
      var: result
```
run with command:
```
ansible-playbook psql.yml
```


Referensi:

* https://docs.ansible.com/ansible/latest/modules/postgresql_query_module.html
* https://github.com/elmarx/ansible-mysql-query

