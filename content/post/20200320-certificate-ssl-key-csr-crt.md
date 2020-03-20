---
title: "Certificate ssl key csr crt"
date: 2020-03-20T08:17:54+07:00
tags: ["linux", "certificate", "ssl", "csr", "crt", "tips"]
author: "Widya"
draft: false
---

## random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/root/.rnd

If you have RANDFILE=... configuration lines in your openssl.cnf than you can safely remove them

* https://github.com/openssl/openssl/issues/7754

