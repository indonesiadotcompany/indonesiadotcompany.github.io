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
    {{ range .Site.Taxonomies.tags }}
            <li><a href="{{ .Page.Permalink }}">{{ .Page.Title }}</a> {{ .Count }}</li>
    {{ end }}
</ul>
