---
title: "2FA with Google Authenticator"
date: 2020-06-23T08:17:54+07:00
tags: ["linux", "tips", "2fa", "google-authenticator"]
author: "Widya"
draft: false
---

## Ubuntu
### Pastikan terdapat baris berikut di /etc/ssh/sshd_config
```
ChallengeResponseAuthentication yes
UsePAM yes
```
lalu restart service sshd

### Tambahkan baris berikut di akhir /etc/pam.d/common-auth
```
auth required pam_google_authenticator.so nullok
```

### Go go gadget
install google-authenticator app from android playstore, then add the server to show the code

Referensi:

* https://www.techradar.com/how-to/how-to-add-two-factor-authentication-to-linux-with-google-authenticator
* https://wiki.alpinelinux.org/wiki/Two_Factors_Authentication_With_OpenSSH

