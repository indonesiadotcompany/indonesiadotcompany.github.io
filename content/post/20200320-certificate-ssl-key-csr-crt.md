---
title: "Certificate ssl key csr crt"
date: 2020-03-20T08:17:54+07:00
tags: ["linux", "certificate", "ssl", "csr", "crt", "tips"]
author: "Widya"
draft: false
---

## create csr ubuntu 18
```
openssl genrsa –out domain.key 2048
openssl req –new –key domain.key –out domain.csr
#or
#openssl req -new -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr
```

* https://vitux.com/how-to-generate-a-certificate-signing-request-csr-on-ubuntu/
* https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-18-04

## random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/root/.rnd

If you have RANDFILE=... configuration lines in your openssl.cnf than you can safely remove them

* https://github.com/openssl/openssl/issues/7754

## convert p7b / p7c / pkcs7 to crt

### Description
What are the differences between .p7b, .pfx, .p12, .pem, .der, .crt & .cer Certificates?

With so many servers, some require different formats.

## PEM Format
* It is the most common format used for certificates
* Most servers (Ex: Apache) expects the certificates and private key to be in a separate files
  * Usually they are Base64 encoded ASCII files
  * Extensions used for PEM certificates are .cer, .crt, .pem, .key files
  * Apache and similar server uses PEM format certificates
 
## DER Format
* The DER format is the binary form of the certificate
* All types of certificates & private keys can be encoded in DER format
* DER formatted certificates do not contain the "BEGIN CERTIFICATE/END CERTIFICATE" statements
* DER formatted certificates most often use the ‘.cer’ and '.der' extensions
* DER is typically used in Java Platforms
 
## P7B/PKCS#7 Format

* The PKCS#7 or P7B format is stored in Base64 ASCII format and has a file extension of .p7b or .p7c
* A P7B file only contains certificates and chain certificates (Intermediate CAs), not the private key
* The most common platforms that support P7B files are Microsoft Windows and Java Tomcat

## PFX/P12/PKCS#12 Format

* The PKCS#12 or PFX/P12 format is a binary format for storing the server certificate, intermediate certificates, and the private key in one encryptable file
* These files usually have extensions such as .pfx and .p12
* They are typically used on Windows machines to import and export certificates and private keys

If your server/device requires a different certificate format other than Base64 encoded X.509, a third party tool such as OpenSSL can be used to convert the certificate into the appropriate format.

```
openssl pkcs7 -print_certs -in old.p7b -out new.crt
#or
openssl pkcs7 -print_certs -inform der -in a.p7c -out out.cer
```
## create cert with ca certificate
https://www.centlinux.com/2019/01/configure-certificate-authority-ca-centos-7.html
```
cd /etc/pki/CA/private
openssl genrsa -aes128 -out tower1CA.key 2048
openssl req -new -x509 -days 1825 -key tower1CA.key -out ../certs/tower1CA.crt
cd /etc/pki/tls/private
openssl genrsa -out tower1.key 1024
openssl req -new -key tower1.key -out tower1.csr
openssl x509 -req -in tower1.csr -CA ../../CA/certs/tower1CA.crt -CAkey ../../CA/private/tower1CA.key -CAcreateserial -out ../certs/tower1.crt -days 3650
```

## import certificate
https://thomas-leister.de/en/how-to-import-ca-root-certificate/
### Linux (Debian / Ubuntu) - system
```
sudo mkdir /usr/local/share/ca-certificates/extra
sudo cp root.cert.pem /usr/local/share/ca-certificates/extra/root.cert.crt
sudo update-ca-certificates
```
### Browser (Firefox, Chromium, …)
```
sudo apt install libnss3-tools
```
This little helper script finds trust store databases and imports the new root certificate into them.
```
#!/bin/bash

### Script installs root.cert.pem to certificate trust store of applications using NSS
### (e.g. Firefox, Thunderbird, Chromium)
### Mozilla uses cert8, Chromium and Chrome use cert9

###
### Requirement: apt install libnss3-tools
###


###
### CA file to install (CUSTOMIZE!)
###

certfile="root.cert.pem"
certname="My Root CA"


###
### For cert8 (legacy - DBM)
###

for certDB in $(find ~/ -name "cert8.db")
do
    certdir=$(dirname ${certDB});
    certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d dbm:${certdir}
done


###
### For cert9 (SQL)
###

for certDB in $(find ~/ -name "cert9.db")
do
    certdir=$(dirname ${certDB});
    certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d sql:${certdir}
done
```


* https://knowledge.digicert.com/generalinformation/INFO4448.html
* https://www.google.com/search?q=p7b+to+crt+linux
* https://gist.github.com/jmervine/e4c9af3adb14b78856cc
* https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html
