+++
title = "Nginx tips and trick"
date = 2018-02-19T10:18:00Z
updated = 2018-02-19T10:18:23Z
tags = ["tuning", "web"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

## Nginx location directory
```
  location /static/ {
    alias /web/test.example.com/static/;
    autoindex on;
  }
```

* https://stackoverflow.com/questions/11570321/configure-nginx-with-multiple-locations-with-different-root-folders-on-subdomain

Referensi:

* https://www.sitepoint.com/brotli-compression-wordpress/
