---
title: "DOH DNS over HTTPS"
date: 2019-10-13T07:09:53+07:00
tags: ["linux", "dns", "doh", "dnsoverhttps"]
author: "Widya"
draft: false
---

## Security DNS di sisi client
### Install dnscrypt-proxy

```
add-apt-repository ppa:shevchuk/dnscrypt-proxy
apt update
apt install dnscrypt-proxy
```

Edit file /etc/dnscrypt-proxy/dnscrypt-proxy.toml dan rubah variabel **server_name** menjadi seperti contoh berikut:

```
server_names = ['cloudflare', 'google']
```

lalu restart service dnscrypt-proxy

```
systemctl restart dnscrypt-proxy
```
edit /etc/resolv.conf agar mengarah ke dnscrypt-proxy
```
nameserver 127.0.2.1
```

## Install DNS over HTTPS server
### Install dengan cara paket instalasi deb
```
wget "https://www.aaflalo.me/?smd_process_download=1&download_id=1326"
mv index* doh-server.deb
dpkg -i doh-server_*_amd64.deb
```

### Install dengan cara compile
```
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
wget https://github.com/m13253/dns-over-https/archive/v2.1.2.tar.gz
tar xzf v2.1.2.tar.gz
cd dns-over-https-2.1.2
make && make install
add-apt-repository ppa:ondrej/nginx
apt update
apt install nginx-full
```

Buat file /etc/nginx/sites-available/doh yang isinya:
```
upstream dns-backend {
    server 127.0.0.1:8053;
}
server {
        listen 80;
        server_name dns.example.com;
        root /var/www/html/dns;
        access_log /var/log/nginx/dns.access.log;
         location /dns-query {
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
                proxy_set_header X-NginX-Proxy true;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_redirect off;
                proxy_set_header        X-Forwarded-Proto $scheme;
                proxy_read_timeout 86400;
                proxy_pass http://dns-backend/dns-query ;
        }
}
```
lalu jalankan
```
ln -s /etc/nginx/sites-available/dns-over-https /etc/nginx/sites-enabled/dns-over-https
nginx -t
systemctl reload nginx
add-apt-repository ppa:certbot/certbot
apt update
apt install python-certbot-nginx
certbot --nginx -d dns.example.com
```

If that’s successful, certbot will ask how you’d like to configure your HTTPS settings.
```
Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
-------------------------------------------------------------------------------
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
-------------------------------------------------------------------------------
Select the appropriate number [1-2] then [enter] (press 'c' to cancel):
```
I advise to choose redirect to be sure it use only HTTPS.

Edit the file /etc/letsencrypt/options-ssl-nginx.conf and replace its content by this.
```
ssl_session_cache shared:le_nginx_SSL:1m;
ssl_session_timeout 1440m;
ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;
# Enable modern TLS cipher suites
ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
# The order of cipher suites matters
ssl_prefer_server_ciphers on;
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
```

Then reload nginx.
```
systemctl reload nginx
```

## TIPS
Untuk menggunakan server DOH yang telah kita buat pada dnscrypt-proxy client, buat stamp dulu di https://dnscrypt.info/stamps/

![DOH](images/doh.png)

lalu isi nama doh dan stamp nya seperti contoh:
```
[static]

[static.'gcp']
   stamp = 'sdns://AgcAAAAAAAAADTM0Ljg3LjExNy4xMDUADWdjcC5iaXJhdS5jb20KL2Rucy1xdWVyeQ'
[static.'doh']
   stamp = 'sdns://AgcAAAAAAAAACzQ1Ljc3LjM2LjU0ABJkb2guYmlyYXUuY29tOjM0NDMKL2Rucy1xdWVyeQ'
```
dan tambahkan dibagian server_name menjadi seperti ini:
```
server_names = ['doh', 'gcp', 'cloudflare', 'google']
```

Referensi:

* https://www.aaflalo.me/2018/10/tutorial-setup-dns-over-https-server/
* https://github.com/m13253/dns-over-https
* https://dnscrypt.info/stamps/
