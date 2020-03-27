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
```

* https://vitux.com/how-to-generate-a-certificate-signing-request-csr-on-ubuntu/

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

* https://knowledge.digicert.com/generalinformation/INFO4448.html
* https://www.google.com/search?q=p7b+to+crt+linux
* https://gist.github.com/jmervine/e4c9af3adb14b78856cc
