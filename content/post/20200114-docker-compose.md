---
title: "Docker Compose on Linux"
date: 2020-01-15T08:17:54+07:00
tags: ["linux", "docker", "docker-compose", "container"]
author: "Widya"
draft: false
---

## Setup
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```


Referensi:

* https://docs.docker.com/compose/install/

