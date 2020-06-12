---
title: "Postgresql"
date: 2020-06-12T08:17:54+07:00
tags: ["linux", "beginner", "postgresql", "psql"]
author: "Widya"
draft: false
---

## Install pgadmin4 di ubuntu 18
```
apt-get install curl ca-certificates gnupg
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
apt update
apt install pgadmin4
```

## create db
```
su - postgres
psql
create database dvdrental;
\q
wget https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
unzip dvdrental.zip
pg_restore -d dvdrental dvdrental.tar
psql -d dvdrental
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO pgtower;
\q
psql -U pgtower -d dvdrental
select first_name from customer;
\q
```

## pg_hba.conf
```
cat /var/opt/rh/rh-postgresql10/lib/pgsql/data/pg_hba.conf

# Database administrative login by UNIX sockets
# note: you may wish to restrict this further later
local   all         postgres                                peer

# TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD
local   all         all                               scram-sha-256
host    all         all         127.0.0.1/32 scram-sha-256
host    all         all         ::1/128 scram-sha-256
host    all         all         10.11.8.0/24    md5
```

Referensi:

* https://www.postgresqltutorial.com/postgresql-sample-database/
* https://bobcares.com/blog/permission-denied-for-database-postgres/

