---
title: "Ansible Test Implement for Security Hardening Solution 1 - Briefing Session"
date: 2020-03-09T17:17:54+07:00
tags: ["linux", "ansible", "ansibletower"]
author: "Widya"
draft: false
---

## Background

* belum adanya standarisasi system security perusahaan yang mengacu kepada baseline standarisasi internasional seperti CIS, NIST atau PCI-DSS
* pekerjaan manual yang sangat kompleks, lama dan berat jika harus dilakukan secara manual untuk melakukan standarisasi security system
* masih banyaknya server perusahaan yang non-comply dengan standarisasi sistem security yang telah dibuat oleh perusahaan

## Objective

* mengurangi serangan
* konfigurasi yang robust
* secured protocols
* comply kepada standarisasi internasional dan standarisasi internal perusahaan

## Technical Requirements

Langkah 1:

* Membuat security baseline
  * custom baseline CIS / PCI-DSS yang digabung dengan baseline internal perusahaan
* Implementasi dan enforce security baseline

### Technical Requirements - Overall Scope of Work and deliverable:

* Architecture and End-to-End Design (N)
* Hardware, Software and infrastructure components
  * Hardware
    * 2 server postgresql / ansible tower database server
    * 3 server ansible tower (cluster)
    * 1 server ansible tower for development / testing
  * Software
    * redhat / centos OS
    * ansible
    * ansible tower
    * postgresql
    * openscap
    * ansible playbook / roles based on CIS / PCI-DSS / NIST baseline that combined with internal company baseline
* Hardware and software delivery and installation, incl. necessary testing (N)
  * install dua postgresql active - passive
  - install ansible tower for production
  * install ansible tower for development
  * test implementasi / deployment manage server dari ansible tower development, lalu setelah ok, copy / replikasi semua template, playbook dan yg berkaitan ke ansible tower production
* Required supporting equipment and materials
* Services, including project management, implementation, integration and migration (N)
* Technical support (3 years) including
  * Hardware and software updates
  * Service request support and management (SRSM)
  * spares management with instant replacement (SPMS)
  * first line maintenance incl. preventative maintenances (O&M Assistance)

### Technical Requirements Software Scope

* Software components shall be grouped in two areas : 1. Development, 2. Operation

### Technical Requirements Services Scope

* Detailed micro-design and security implementation plan (N)
* Project management & project technical documentation according to Telkomsel standards. (N)

### Technical Requirements - Compliance to requirement

Statements of Compliances

* Full Comply = The proposed solution can fulfill the specified requirement at the start of the project (Day 1)

* Comply with Customization = The proposed solution can fulfill the specified requirements with some customizations, and it must be ready when it is required by specific phase within the implementation timeline

* Not Comply = The proposed solution cannot fulfill the specified requirements

Referensi:

* https://indonesiadot.com

