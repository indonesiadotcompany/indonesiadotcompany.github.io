---
title: "Qmail Toaster"
date: 2020-03-16T08:17:54+07:00
tags: ["linux", "qmail", "qmailtoaster", "mail", "mailserver"]
author: "Widya"
draft: false
---

## Qmail ssl letsencrypt
```
yum install certbot python2-certbot python2-certbot-apache python2-certbot-dns-cloudflare
cat <EOF> cloudflare.ini
dns_cloudflare_email = user@example.com
dns_cloudflare_api_key = j2c2166gd6688921b1497e7cfd6cf69f7f936
EOF
certbot certonly --dns-cloudflare --dns-cloudflare-credentials cloudflare.ini dns-cloudflare-propagation-seconds 60 -d *.example.com
```

Add to apache vhost centos
```
SSLCertificateFile /etc/letsencrypt/live/example.com/cert.pem
SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem
Include /etc/letsencrypt/options-ssl-apache.conf
SSLCertificateChainFile /etc/letsencrypt/live/example.com/fullchain.pem
```

Add to Dovecot CentOS 6 & 7 (/etc/dovecot/toaster.conf)
```
 ssl_cert = </etc/letsencrypt/live/example.com/fullchain.pem
 ssl_key = </etc/letsencrypt/live/example.com/privkey.pem
```

Add to Qmail CentOS 6 & 7
```
 cp -p /var/qmail/control/servercert.pem /var/qmail/control/servercert.pem.bak
 cat /etc/letsencrypt/live/example.com/privkey.pem /etc/letsencrypt/live/example.com/fullchain.pem > /var/qmail/control/servercert.pem
```
Let's Encrypt auto renewal
```
  0 0 * * * /opt/certbot/certbot renew       #CentOS 7
```

Restart Qmail and Dovecot
```
qmailctl stop
qmailctl start
systemctl restart dovecot
systemctl restart httpd
```

* http://www.qmailtoaster.net/ssl.html

