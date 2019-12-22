---
title: "Android USB File Transfer"
date: 2019-10-14T08:17:54+07:00
tags: ["linux", "tips", "android", "file", "mtp"]
author: "Widya"
draft: false
---

## Android USB File Transfer
```
add-apt-repository ppa:webupd8team/unstable
apt update
apt-get install go-mtpfs
mkdir /media/MyAndroid
```

### mount
```
go-mtpfs /media/MyAndroid
```

### unmount
```
fusermount -u /media/MyAndroid
```

or you can use softdatacable from damiapp at play store, after install the software then you can start the computer transfer, it will open ftp://ip.of.android:8888, so you can access from pc via ftp client like filezilla.

Referensi:

* http://www.webupd8.org/2012/12/how-to-mount-android-40-ubuntu-go-mtpfs.html
* https://askubuntu.com/questions/626941/how-to-access-my-androids-files-using-wi-fi-in-ubuntu
