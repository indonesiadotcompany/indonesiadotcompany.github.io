---
title: "Gitlab on Ubuntu 16.04"
date: 2020-01-14T08:17:54+07:00
tags: ["linux", "git", "gitlab", "repository"]
author: "Widya"
draft: false
---

## Instalasi Gitlab di Ubuntu 16.04

## Widya Gitlab

* https://widgitgog.birau.com/dashboard/projects

### change / update hostname
```
sed -i 's/widgitgog/widgit/g' /etc/gitlab/gitlab.rb
gitlab-ctl reconfigure
gitlab-ctl restart
```

* https://docs.gitlab.com/omnibus/settings/configuration.html

Referensi:

* https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/
* https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-gitlab-on-ubuntu-16-04
