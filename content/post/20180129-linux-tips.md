+++
title = "Linux Tips and Trick"
date = 2018-01-29T00:59:00Z
updated = 2020-01-20T09:37:10Z
tags = ["linux", "server", "tips", "trick"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

## cron without sending mail
tambahkan MAILTO="" di awal cron nya tambahkan &gt;/dev/null 2&gt;&amp;&amp;1 atau &gt; /dev/null atau &gt; /dev/null 2&gt;&amp;1 || true di belakang command cron nya

## linux rm file list too long
```
cd direktoriyangfilenyabanyak
ls -1 | wc -l && time find . -type f -delete
find . -type f -print -delete
```

## incron

Ref:

* http://inotify.aiken.cz/?section=incron&page=faq&lang=en

## rsync only existing file

```
rsync -va --existing /data/backups/etc/ /data/backups/host1/etc/
```

## Umask follow parent / setgid
```
chmod g+s /namafolder
```

Ref:

* https://unix.stackexchange.com/questions/117190/best-way-to-sync-files-copy-only-existing-files-and-only-if-newer-than-target
* https://superuser.com/questions/151911/how-to-make-new-file-permission-inherit-from-the-parent-directory

## awk example
```
docker images
docker images | grep widharbor.birau.com
docker images | grep widharbor.birau.com | wc -l
docker images | grep widharbor.birau.com | awk '{ print $1 ":" $2 }'
docker rmi `docker images | grep widharbor.birau.com | awk '{ print $1 ":" $2 }'`
```

* https://www.linuxtechi.com/awk-command-tutorial-with-examples/

