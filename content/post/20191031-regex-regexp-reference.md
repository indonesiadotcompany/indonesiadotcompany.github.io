---
title: "Regex / Regexp Reference"
date: 2019-10-31T08:17:54+07:00
tags: ["linux", "regex", "regexp", "tips"]
author: "Widya"
draft: true
---

## Regex Case insensitive

(?i)

Referensi:

* https://stackoverflow.com/questions/22961535/what-does-i-and-in-this-regex-mean
* https://regex101.com/r/hE9gB4/1
* https://regexr.com/3f4vo

## Regex to match string containing two names
###Explanation of command that i am going to write:-

. means any character, digit can come in place of .

* means zero or more occurrences of thing written just previous to it.

| means 'or'.

So,
```
james.*jack
```
would search james , then any number of character until jack comes.

Since you want either jack.*james or james.*jack

Hence Command:

jack.*james|james.*jack

Ref:

* https://stackoverflow.com/questions/4389644/regex-to-match-string-containing-two-names-in-any-order

## Regex not contain substring / a word

Ref:

https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word
