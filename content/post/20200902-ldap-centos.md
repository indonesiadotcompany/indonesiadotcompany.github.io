---
title: "LDAP on Centos 7"
date: 2020-09-02T18:17:54+07:00
tags: ["linux", "centos", "ldap"]
author: "Widya"
draft: false
---

## Server setup
* https://www.itzgeek.com/how-tos/linux/centos-how-tos/step-step-openldap-server-configuration-centos-7-rhel-7.html
```
yum -y install openldap compat-openldap openldap-clients openldap-servers
systemctl start slapd
systemctl enable slapd
slappasswd -h {SSHA} -s ldppassword
```
make note of ldappassword

create file db.ldif
```
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=itzgeek,dc=local

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=ldapadm,dc=itzgeek,dc=local

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: {SSHA}d/thexcQUuSfe3rx3gRaEhHpNJ52N8D3
```
replace the value of olcRootPW with ldappassword above
```
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif
```
create monitor.ldif
```
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth" read by dn.base="cn=ldapadm,dc=itzgeek,dc=local" read by * none
```
then run
```
ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif
```

### setup ldap database
```
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap:ldap /var/lib/ldap/*
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
```
create base.ldif
```
dn: dc=itzgeek,dc=local
dc: itzgeek
objectClass: top
objectClass: domain

dn: cn=ldapadm ,dc=itzgeek,dc=local
objectClass: organizationalRole
cn: ldapadm
description: LDAP Manager

dn: ou=People,dc=itzgeek,dc=local
objectClass: organizationalUnit
ou: People

dn: ou=Group,dc=itzgeek,dc=local
objectClass: organizationalUnit
ou: Group
```
build the directory structure
```
ldapadd -x -W -D "cn=ldapadm,dc=itzgeek,dc=local" -f base.ldif
```
create ldap user, create file raj.ldif
```
dn: uid=raj,ou=People,dc=itzgeek,dc=local
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: raj
uid: raj
uidNumber: 9999
gidNumber: 100
homeDirectory: /home/raj
loginShell: /bin/bash
gecos: Raj [Admin (at) ITzGeek]
userPassword: {crypt}x
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
```
create it
```
ldapadd -x -W -D "cn=ldapadm,dc=itzgeek,dc=local" -f raj.ldif
```
assign password to the user
```
ldappasswd -s password123 -W -D "cn=ldapadm,dc=itzgeek,dc=local" -x "uid=raj,ou=People,dc=itzgeek,dc=local"
```
verify ldap entries
```
ldapsearch -x cn=raj -b dc=itzgeek,dc=local
```
to delete the user
```
ldapdelete -W -D "cn=ldapadm,dc=itzgeek,dc=local" "uid=raj,ou=People,dc=itzgeek,dc=local"
```

### enable ldap logging
add below line to /etc/rsyslog.conf
```
local4.* /var/log/ldap.log
#*
```
then restart rsyslog
```
systemctl restart rsyslog
```

## client configuration
* https://www.itzgeek.com/how-tos/linux/centos-how-tos/step-step-openldap-server-configuration-centos-7-rhel-7.html/2
* https://tylersguides.com/guides/configuring-openldap-authentication-centos-7/

```
yum install -y openldap-clients nss-pam-ldapd
authconfig --enableldap --enableldapauth --ldapserver=192.168.1.10 --ldapbasedn="dc=itzgeek,dc=local" --enablemkhomedir --update
systemctl restart  nslcd
```

### verify ldap login
```
getent passwd raj
```

then test ssh to the ldap client with newly created user

## phpldapadmin
* https://hostadvice.com/how-to/how-to-install-phpldapadmin-on-centos-7/

```
yum install epel-release -y
yum -y install phpldapadmin
```
Modify your configuration file located at /etc/httpd/conf.d/phpldapadmin.conf
```
<IfModule mod_authz_core.c>
    # Apache 2.4
    Require all granted
  </IfModule>
```

### configure phpldapadmin
```
$servers->setValue('server','host','127.0.0.1');
$servers->setValue('server','port',389);
$servers->setValue('login','bind_id','cn=ldapadm,dc=itzgeek,dc=local');
$servers->setValue('appearance','password_hash','ssha');
$servers->setValue('login','attr','dn');
//$servers->setValue('login','attr','uid');
```
then start httpd
```
systemctl restart httpd
```

