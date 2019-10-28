---
title: "Magic of Sed"
date: 2019-10-14T08:17:54+07:00
tags: ["linux", "server", "sed", "bash", "tips"]
author: "Widya"
draft: false
---

## Insert every line in linux

```
sed 's/^/apt-get purge -y /' aptwantopurge.txt > aptpurge.txt
```

Referensi:

* https://www.google.com/search?q=insert+every+line+linux&oq=insert+every+line+linux
* https://stackoverflow.com/questions/4080526/using-sed-to-insert-text-at-the-beginning-of-each-line
* https://www.google.com/search?q=sed+cheatsheet&oq=sed+cheatsheet
* https://gist.github.com/widyamedia/c6a14e81375b8c1394f14f6e5d456521
