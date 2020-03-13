---
title: "Sentinelone EPP EDR"
date: 2020-03-13T06:17:54+07:00
tags: ["linux", "tips"]
author: "Widya"
draft: false
---

## cloud connectivity became offline

0. make sure all of the docker container is run with docker ps

1. the date of the on-prem server must be UTC
```
date
```
Wed Mar 11 09:18:42 UTC 2020

2. test cloudgateway api info with curl
```
curl -v https://cloudgateway-prod-ap.sentinelone.net/api/v2/info
```
* Trying 13.112.219.166...
* TCP_NODELAY set
* Connected to cloudgateway-prod-ap.sentinelone.net (13.112.219.166) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
* CAfile: /etc/ssl/certs/ca-certificates.crt
CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Request CERT (13):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Certificate (11):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Client hello (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES256-GCM-SHA384
* ALPN, server accepted to use http/1.1
* Server certificate:
* subject: C=US; ST=California; L=Palo Alto; O=Sentinel Labs, Inc.; CN=*.sentinelone.net
* start date: Sep 11 00:00:00 2019 GMT
* expire date: Dec 1 12:00:00 2021 GMT
* subjectAltName: host "cloudgateway-prod-ap.sentinelone.net" matched cert's "*.sentinelone.net"
* issuer: C=US; O=DigiCert Inc; CN=DigiCert SHA2 Secure Server CA
* SSL certificate verify ok.
> GET /api/v2/info HTTP/1.1
> Host: cloudgateway-prod-ap.sentinelone.net
> User-Agent: curl/7.58.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.14.0 (Ubuntu)
< Date: Wed, 11 Mar 2020 09:19:32 GMT
< Content-Type: application/json
< Content-Length: 20
< Connection: keep-alive
< Access-Control-Allow-Origin: *
< Access-Control-Allow-Headers: Authentication-Token
<
{"version":"4.1.4"}
* Connection #0 to host cloudgateway-prod-ap.sentinelone.net left intact

3. give settings.ini to support

4. From the outputs you sent - > Everything seems to be Ok,

4.1. Add the following lines to the /etc/hosts file -> Save -> Exit:

54.64.165.125 cloudgateway-prod-ap.sentinelone.net
13.112.219.166 cloudgateway-prod-ap.sentinelone.net

4.2. Run -> sudo docker exec -u 0 -it scheduler /bin/bash
The vi /etc/hosts ->Add the 2 lines> Save->Exit
54.64.165.125 cloudgateway-prod-ap.sentinelone.net
13.112.219.166 cloudgateway-prod-ap.sentinelone.net

- Restart the server after all the changes
