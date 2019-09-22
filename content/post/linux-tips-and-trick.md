+++
title = "Linux Tips and Trick"
date = 2018-01-29T00:59:00Z
updated = 2018-02-17T17:37:10Z
tags = ["linux", "server"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

<p dir="ltr"><b>cron without sending mail</b><br>tambahkan MAILTO="" di awal cron nya tambahkan &gt;/dev/null 2&gt;&amp;&amp;1 atau &gt; /dev/null atau &gt; /dev/null 2&gt;&amp;1 || true di belakang command cron nya</p><p dir="ltr"><b>linux rm file list too long</b><br>cd direktoriyangfilenyabanyak<br>ls -1 | wc -l &amp;&amp; time find . -type f -delete<br>find . -type f -print -delete</p><p dir="ltr">incron<br>http://inotify.aiken.cz/?section=incron&amp;page=faq&amp;lang=en</p>
