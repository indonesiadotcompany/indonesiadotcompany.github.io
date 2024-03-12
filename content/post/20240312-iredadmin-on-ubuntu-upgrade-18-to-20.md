---
title: "Upgrade ubuntu 18.04 to 20.04 with iredadmin inside"
date: 2024-03-22T16:07:54+07:00
tags: ["linux", "ubuntu", "upgrade", "warning", "iredadmin", "mail"]
author: "Widya"
draft: false
---

## Upgrade iRedMail to the latest stable release first
* https://docs.iredmail.org/iredmail.releases.html

## Upgrade Ubuntu OS
```
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove
sudo apt install update-manager-core
sudo do-release-upgrade
```
reboot once complete

## Upgrade Dovecot config files
```
cd /etc/dovecot/
perl -pi -e 's/^ssl_protocols/#${1}/g' dovecot.conf
perl -pi -e 's#(postmaster_address.*)##g' dovecot.conf
perl -pi -e 's#^(mail_plugins.*) stats(.*)#${1} old_stats${2}#g' dovecot.conf
perl -pi -e 's#imap_stats#imap_old_stats#g' dovecot.conf
perl -pi -e 's#service stats#service old-stats#g' dovecot.conf
perl -pi -e 's#fifo_listener stats-mail#fifo_listener old-stats-mail#g' dovecot.conf
perl -pi -e 's#stats_refresh#old_stats_refresh#g' dovecot.conf
perl -pi -e 's#stats_track_cmds#old_stats_track_cmds#g' dovecot.conf
```

On Debian/Ubuntu/OpenBSD/FreeBSD, please add new setting in dovecot.conf:
```
ssl_dh = </etc/ssl/dh2048_param.pem

service stats {
    unix_listener stats-reader {
        user = vmail
        group = vmail
        mode = 0660
    }

    unix_listener stats-writer {
        user = vmail
        group = vmail
        mode = 0660
    }
}
```
TIPS: and remove another stats-writer

### SQL structure changes for MySQL/MariaDB/PostgreSQL backends
```
mysql
USE vmail;
ALTER TABLE mailbox ADD COLUMN enableimaptls TINYINT(1) NOT NULL DEFAULT 1;
ALTER TABLE mailbox ADD INDEX (enableimaptls);
ALTER TABLE mailbox ADD COLUMN enablepop3tls TINYINT(1) NOT NULL DEFAULT 1;
ALTER TABLE mailbox ADD INDEX (enablepop3tls);
ALTER TABLE mailbox ADD COLUMN enablesievetls TINYINT(1) NOT NULL DEFAULT 1;
ALTER TABLE mailbox ADD INDEX (enablesievetls);
```
restart dovecot

## Upgrade iRedAPD
```
cd /root
wget -O iRedAPD-5.3.3.tar.gz https://github.com/iredmail/iRedAPD/archive/5.3.3.tar.gz
tar zxf iRedAPD-5.3.3.tar.gz
cd iRedAPD-5.3.3/tools/
bash upgrade_iredapd.sh
```


Referensi:

* https://www.google.com/search?client=firefox-b-d&q=iredadmin+ubuntu+upgrade
* https://docs.iredmail.org/upgrade.ubuntu.18.04-20.04.html
* https://docs.iredmail.org/upgrade.dovecot.2.2-2.3.html
* https://docs.iredmail.org/upgrade.iredapd.html
* https://forum.iredmail.org/topic2457-solved-error-1270017777-connection-refused.html

