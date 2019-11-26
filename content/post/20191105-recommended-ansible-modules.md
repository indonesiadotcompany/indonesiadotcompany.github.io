---
title: "Recommended Ansible Modules"
date: 2019-11-05T08:17:54+07:00
tags: ["linux", "ansible", "tips", "automation"]
author: "Widya"
draft: false
---

# Frequently Used Module
## blockinfile

Module ini saya gunakan ketika muncul error pada saat menggunakan module lineinfile untuk memasukan beberapa baris sekaligus dalam beberapa tasks, dan ternyata dengan menggunakan module ini dengan hanya satu task bisa memasukan langsung beberapa baris.

Ini hanya sekedar contoh, meski banyak parameter yang digunakan, cuma fokus kepada parameter minimalnya adalah path dan block saja.
```
- name: Insert correct line to /etc/ntp.conf
  blockinfile:
    path: /etc/ntp.conf
    insertafter: ^#?server
    state: present
    block: |
      server "{{ ntp1 }}"
      server "{{ ntp2 }}"
  notify: restart ntp
```
Referensi:

* https://www.google.com/search?q=lineinfile+multiple+lines
* https://stackoverflow.com/questions/24334115/ansible-lineinfile-for-several-lines
* https://docs.ansible.com/ansible/latest/modules/blockinfile_module.html
* https://github.com/widansible/ansible/blob/devel/lib/ansible/modules/files/blockinfile.py

## find

Berikut contoh module find yang dicombine dengan module set_fact, when untuk menggunakan result matched (when seperti if dalam scripting / programming)
```
    - name: Search /etc/audit/rules.d for other DAC audit rules
      find:
        paths: /etc/audit/rules.d
        recurse: false
        contains: -F key=perm_mod$
        patterns: '*.rules'
      register: find_fchown
      when: ansible_virtualization_role != "guest" or ansible_virtualization_type != "docker"
    - name: If existing DAC ruleset not found, use /etc/audit/rules.d/privileged.rules as the recipient for the rule
      set_fact:
        all_files:
          - /etc/audit/rules.d/privileged.rules
      when:
        - find_fchown.matched is defined and find_fchown.matched == 0
        - ansible_virtualization_role != "guest" or ansible_virtualization_type != "docker"
    - name: Use matched file as the recipient for the rule
      set_fact:
        all_files:
          - '{{ find_fchown.files | map(attribute=''path'') | list | first }}'
      when:
        - find_fchown.matched is defined and find_fchown.matched > 0
        - ansible_virtualization_role != "guest" or ansible_virtualization_type != "docker"
```

Referensi:
* file remediation.yml dari oscap
* https://docs.ansible.com/ansible/latest/modules/find_module.html

## pamd

module ini berguna untuk edit pam service tanpa harus mengedit file nya langsung, tanpa harus menggunakan module lineinfile, blockinfile, replace, etc. Dan berikut contohnya:

```
    - name: Add unlock_time argument to pam_faillock preauth
      pamd:
        name: '{{ item }}'
        type: auth
        control: required
        module_path: pam_faillock.so
        module_arguments: preauth silent unlock_time={{ var_accounts_passwords_pam_faillock_unlock_time
          }}
        state: args_present
      loop:
        - system-auth
        - password-auth
```

Referensi:

* file remediation.yml oscap
* https://docs.ansible.com/ansible/latest/modules/pamd_module.html

## debug

```
    - name: download report
      fetch:
        src: /tmp/oscap-report.html
        dest: /home/ansible/public_html/oscap/{{ ansible_hostname }}-report-{{ DATE }}.html
        flat: yes
    - debug:
        msg: http://34.87.94.24/oscap/{{ ansible_hostname }}-report-{{ DATE }}.html
```

Ref:

* https://docs.ansible.com/ansible/latest/modules/debug_module.html


