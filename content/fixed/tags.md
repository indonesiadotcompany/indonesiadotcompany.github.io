---
title: Tags
featured_image: "images/teknologi.png"
omit_header_text: true
description: Tags and Categories
type: page
sidebar: true
menu:
  main: {}

---

<ul>
    {{ range (.GetTerms "tags") }}
        <li><a href="{{ .Permalink }}">{{ .LinkTitle }}</a></li>
   {{ end }}
</ul>
