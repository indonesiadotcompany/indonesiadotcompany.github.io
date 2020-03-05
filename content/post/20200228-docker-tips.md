---
title: "Docker Tips"
date: 2020-02-28T08:07:54+07:00
tags: ["docker", "container", "tips"]
author: "Widya"
draft: false
---

## Docker run example
```
docker run -it alpine /bin/ash
```
Where -i = interactive, -t make tty for the running process, /bin/ash is the command to run.

docker run --help

## How to get ip of running docker
```
docker ps
docker inspect <containernameorid>
docker inspect <containernameorid> | grep '"IPAddress"' | head -n 1
```
Where head is opossite from tail, man head, man tail

* https://stackoverflow.com/questions/43692961/how-to-get-ip-address-of-running-docker-container/47226863#:~:text=Usually%2C%20the%20default%20docker%20ip,first%20container%20should%20be%20172.17.

<div dir="ltr"><b>Rancher</b></div><div dir="ltr">https://rancher.com/swarm/</div><div dir="ltr"><br /></div><div dir="ltr">https://github.com/MoimHossain/docker-viswarm<br /><br />https://stackoverflow.com/ques
tions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host<br /><br /><pre style="background-color: #eff0f1; border: 0px; box-sizing: inherit; color: #242729; font-family: Consolas, Menlo, Monaco, &q
uot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; font-size: 13px; font-stretch: inherit; 
font-variant-numeric: inherit; line-height: inherit; margin-bottom: 1em; max-height: 600px; overflow: auto; padding: 5px; vertical-align: baseline; width: auto; word-wrap: normal;"><code style="border: 0px; box-
sizing: inherit; font-family: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monosp
ace, sans-serif; font-stretch: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; white-space: inherit;">docker 
inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' containernameorid</code></pre><br /><br /><pre style="background-color: #eff0f1; border: 0px; box-sizing: inherit; color: #242729; font-famil
y: Consolas, Menlo, Monaco, &quot;Lucida Console&quot;, &quot;Liberation Mono&quot;, &quot;DejaVu Sans Mono&quot;, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, monospace, sans-serif; font-size:
 13px; font-stretch: inherit; font-variant-numeric: inherit; line-height: inherit; margin-bottom: 1em; max-height: 600px; overflow: auto; padding: 5px; vertical-align: baseline; width: auto; word-wrap: normal;">
<br /></pre></div>

Ref:

* https://docs.docker.com/engine/security/certificates/
* https://docs.docker.com/engine/security/https/

