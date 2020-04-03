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

{{ $taxo := "directors" }} <!-- Use the plural form here -->
{{ with .Param $taxo }}
    <strong>Director{{ if gt (len .) 1 }}s{{ end }}:</strong>
    {{ range $index, $director := . }}
        {{- if gt $index 0 }}, {{ end -}}
        {{ with $.Site.GetPage (printf "/%s/%s" $taxo $director) -}}
            <a href="{{ .Permalink }}">{{ $director }}</a>
        {{- end -}}
    {{- end -}}
{{ end }}
