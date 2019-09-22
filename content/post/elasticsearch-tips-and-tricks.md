+++
title = "elasticsearch tips and tricks"
date = 2018-03-04T20:36:00Z
updated = 2018-03-04T20:41:26Z
tags = ["elasticsearch"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

<b>elasticsearch list indexes</b><br /><br />https://www.google.co.id/search?q=elasticsearch+list+indexes<br />https://www.elastic.co/guide/en/elasticsearch/reference/1.4/_list_all_indexes.html<br /><br />curl 'localhost:9200/_cat/indices?v'<br /><br /><b>elasticsearch installation</b><br /><br />https://github.com/Smile-SA/elasticsuite/wiki/ServerConfig-2.x<br />https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04<br /><br /><b>elasticsearch config</b><br /><br />cluster.name: namacluster<br />bootstrap.memory_lock: true<br /><br /># http://devdocs.magento.com/guides/v2.1/config-guide/elasticsearch/es-overview.html#es-install-es<br />index.query.bool.max_clause_count: 102400<br /><br /># this must be set on non public ip<br />network.host: 127.0.0.1<br />http.port: 9200<br /># https://www.elastic.co/guide/en/elasticsearch/reference/2.4/modules-threadpool.html<br />processor: 2<br />threadpool.bulk.queue_size: 4000<br /><br /># https://github.com/Smile-SA/elasticsuite/wiki/ServerConfig#configure-elasticsearch<br />script.inline: on<br />script.indexed: on<br /><div><br /></div>
