---
title: "Postgresql tips"
date: 2020-06-30T08:17:54+07:00
tags: ["linux", "postgresql", "sql", "tips"]
author: "Widya"
draft: false
---

## Postgresql export and import to mysql
di server postgresql jalankan command berikut untuk export:
```
#pg_dump --verbose --schema-only --table=xx_user --db=test --file=/tmp/montower.sql
pg_dump --verbose --schema-only --db=montower --file=/tmp/montower.sql

psql -U namauserpsql montower
copy xx_user to '/tmp/hosts.txt' with (delimiter ',');
```
di server mysql jalankan command berikut untuk import:
```
mysql --local-infile
create database montower;
use montower;
#load data local infile '/home/postgres/user.txt' into table xx_user fields terminated by ',' lines terminated by '\n';
load data local infile '/tmp/montower.sql' fields terminated by ',' lines terminated by '\n';
load data local infile '/tmp/hosts.txt' into table hosts fields terminated by ',' lines terminated by '\n';
```

Referensi:

* https://www.postgresql.org/docs/9.1/backup-dump.html
* https://www.programmersought.com/article/23102305281/
* https://stackoverflow.com/questions/10762239/mysql-enable-load-data-local-infile

## Postgresql show data tables
* https://kb.objectrocket.com/postgresql/connect-to-postgresql-and-show-the-table-schema-967
```
psql -h 10.11.8.16 -U awxtower1
\c awxtower1db
\d
\q
```

## Postgresql create remote user and database
* https://www.cyberciti.biz/faq/howto-add-postgresql-user-account/
```
create database awxtower1db;
create user awxtower1 with encrypted password 'awxtower1';
grant all privileges on database awxtower1 to awxtower1;
```

