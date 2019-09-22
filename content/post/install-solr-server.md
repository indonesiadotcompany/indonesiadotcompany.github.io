+++
title = "Install solr server"
date = 2017-09-27T20:02:00Z
updated = 2018-01-28T20:51:02Z
tags = ["e-commerce", "magento"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

Here are the steps for Install solr server - base of search engine for magento  these steps run on ubuntu 16.04, because we follow this http://devdocs.magento.com/guides/m1x/other/ht_magento-solr.html, we must install jdk 7 from ppa, but ubuntu 16.04 default with jdk 8  <br><pre>add-apt-repository ppa:openjdk-r/ppa<br />apt update<br />apt-get install openjdk-7-jdk<br />apt install supervisor<br /><br />su - user<br />mkdir apps &amp;&amp; cd apps<br />wget https://archive.apache.org/dist/lucene/solr/3.4.0/apache-solr-3.4.0.tgz<br />tar xzf ../apache-solr-3.4.0.tgz<br />mv apache-solr-3.4.0 solr34<br />cp /var/www/magento/lib/Apache/Solr/conf/* solr34/example/solr/conf/<br />cat &gt;&gt; apps/solr34/example/logging.properties <br /><br /># Default global logging level:<br />.level = INFO<br /><br /># Write to a file:<br />handlers = java.util.logging.FileHandler<br /><br /># Write log messages in XML format:<br /># Use java.util.logging.SimpleFormatter to log like Solr logs to the screen by default<br />java.util.logging.FileHandler.formatter = java.util.logging.XMLFormatter<br /><br /># Log to the current working directory, with log files named solrxxx.log<br />java.util.logging.FileHandler.pattern = /home/ehbm2/logs/solr%u.log<br /><br />[CTRL-C]<br /><br />exit<br /><br />cat &gt;&gt; /etc/supervisor/conf.d/solr.conf <br /><br />[program:solr]<br />user=ehbm2<br />#directory=/home/ehbm2/apps/solr141/example<br />directory=/home/ehbm2/apps/solr34/example<br />command=java -Djava.util.logging.config.file=logging.properties -jar start.jar<br />autostart=true<br />autorestart=true<br /><br />[CTRL-C]<br /><br />/etc/init.d/supervisor restart<br /><br /></pre>
