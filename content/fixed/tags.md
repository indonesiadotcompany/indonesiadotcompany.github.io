---
title: Tags
featured_image: "images/teknologi.png"
omit_header_text: true
description: Tags
type: page
sidebar: true
menu:
  main: {}

---

<ul id="all-tags">
    {{ range $name, $taxonomy := .Site.Taxonomies.tags }}
        {{ with $.Site.GetPage (printf "/tags/%s" $name) }}
            <li><a href="{{ .Permalink }}">{{ $name }}</a></li>
        {{ end }}
    {{ end }}
</ul>
