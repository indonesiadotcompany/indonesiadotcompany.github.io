+++
title = "simple alert monitoring using simplemonitor"
date = 2019-08-11T08:42:00Z
updated = 2019-08-11T08:58:59Z
tags = ["docker", "server", "python", "monitoring"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

googling:&nbsp;https://www.google.com/search?q=simple+alert+monitoring<br /><br />https://jamesoff.github.io/simplemonitor/<br /><br />googling:&nbsp;https://www.google.com/search?q=simplemonitor+docker<br /><br />https://hub.docker.com/r/braindoctor/simplemonitor-docker/<br /><br />mkdir -p /docker/simplemonitor &amp;&amp; cd /docker/simplemonitor<br />cat &gt; docker-compose.yml &lt;<eof p="">version: '3.2'<br />services:<br />&nbsp; simplemonitor:<br />&nbsp; &nbsp; restart: always<br />&nbsp; &nbsp; image: braindoctor/simplemonitor-docker:latest<br />&nbsp; &nbsp; container_name: simplemonitor<br />&nbsp; &nbsp; hostname: mail-124.indonesiadot.com<br />&nbsp; &nbsp; volumes:<br />&nbsp; &nbsp; &nbsp; - ${PWD}/config:/etc/simplemonitor<br />&nbsp; &nbsp; ports:<br />&nbsp; &nbsp; &nbsp; - "8080:8080"<br /></eof><br /><div>EOF</div><div>docker-compose up -d</div><div><br /></div><div>ref:<br />https://simplemonitor.readthedocs.io/en/feature-docs/getting-started.html#writing-configuration-files</div>
