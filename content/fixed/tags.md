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

{{ $taxo := "tags" }} <!-- Use the plural form here -->
<ul id="{{ $taxo }}">
    {{ range .Param $taxo }}
        {{ $name := . }}
        {{ with $.Site.GetPage (printf "/%s/%s" $taxo ($name | urlize)) }}
            <li><a href="{{ .Permalink }}">{{ $name }}</a></li>
        {{ end }}
    {{ end }}
</ul>
