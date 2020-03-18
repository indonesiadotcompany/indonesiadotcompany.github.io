---
title: "ELK for beginner"
date: 2020-03-18T12:17:54+07:00
tags: ["linux", "elk", "logs", "elasticsearch", "logstash", "kibana", "tips"]
author: "Widya"
draft: false
---
# Why we use ELK?
The Elastic Stack (aka ELK) is a robust solution for search, log management, and data analysis. ELK consists of a combination of three open source project: Elasticsearch, Logstash, and Kibana. These projects have specific roles in ELK:

Elasticsearch handles storage and provides a RESTful search and analytics endpoint.
Logstash is a server-side data processing pipeline that ingests, transforms and loads data.
Kibana lets you visualize your Elasticsearch data and navigate the Elastic Stack.
 

1. Elasticsearch -The Amazing Log Search Tool:

Real-time data extraction, and real-time data analytics. Elasticsearch is the engine that gives you both the power and the speed.
2.Logstash — Routing Your Log Data:

 Logstash is a tool for log data intake, processing, and output. This includes virtually any type of log that you manage: system logs, webserver logs, error logs, and app logs.
As administrators, we know how much time can be spent normalizing data from disparate data sources.
We know, for example, how widely Apache logs differ from NGINX logs.
3.Kibana — Visualizing Your Log Data:

Kibana is your log-data dashboard.
Get a better grip on your large data stores with point-and-click pie charts, bar graphs, trendlines, maps and scatter plots.
You can visualize trends and patterns for data that would otherwise be extremely tedious to read and interpret.
# Benefits:
Real-time data and real-time analytics::
The ELK stack gives you the power of real-time data insights, with the ability to perform super-fast data extractions from virtually all structured or unstructured data sources.
Real-time extraction, and real-time analytics. Elasticsearch is the engine that gives you both the power and the speed.
2. Scalable, high-availability, multi-tenant:

With Elasticsearch, you can start small and expand it along with your business growth-when you are ready.
It is built to scale horizontally out of the box. As you need more capacity, simply add another node and let the cluster reorganize itself to accommodate and exploit the extra hardware.
Elasticsearch clusters are resilient, since they automatically detect and remove node failures.
You can set up multiple indices and query each of them independently or in combination.

Some Important Concepts In ELK as follows:

1. Documents:
Documents are JSON objects that are stored within an Elasticsearch index and are    considered the base unit of storage.
In the world of relational databases, documents can be compared to a row in table    Data in documents is defined with fields comprised of keys and values.
A key is the name of the field, and a value can be an item of many different types such as a string, a number, a boolean expression, another object, or an array of values.
Documents also contain reserved fields that constitute the document metadata such as:
```
1.  _index – the index where the document resides
2. _type – the type that the document represents
3.  _id – the unique identifier for the document
```
## 2.Index:
Indices are the largest unit of data in Elasticsearch, are logical partitions of documents and can be compared to a database in the world of relational databases.
You can have as many indices defined in Elasticsearch as you want.
These in turn will hold documents that are unique to each index.
Indices are identified by lowercase names that refer to actions that are performed actions (such as searching and deleting)against the documents that are inside each index.
3.Shards:
Elasticsearch provides the ability to subdivide your index into multiple pieces called shards.
When you create an index, you can simply define the number of shards that you want.
Each shard is in itself a fully-functional and independent “index” that can be hosted on any node in the cluster.
When you create an index, you can define how many shards you want. Each shard is an independent Lucene index that can be hosted anywhere in your cluster.

Sharding is important for two primary reasons:

It allows you to horizontally split/scale your content volume.
It allows you to distribute and parallelize operations across shards (potentially on multiple nodes) thus increasing performance/throughput.
example :
```
curl -XPUT localhost:9200/example -d ‘{
“settings” : {
“index” : {
“number_of_shards” : 2,
“number_of_replicas” : 1
}
}
}’
```
## 4.Replicas:
Replicas, as the name implies, are Elasticsearch fail-safe mechanisms and are basically copies of your index’s shards.
This is a useful backup system for a rainy day — or, in other words, when a node crashes.
Replicas also serve read requests, so adding replicas can help to increase search performance.
To ensure high availability, replicas are not placed on the same node as the original shards (called the “primary” shard) from which they were replicated.

To ensure high availability, replicas are not placed on the same node as the original shards (called the “primary” shard)from which they were replicated.

Replication is important for two primary reasons:

It provides high availability in case a shard/node fails. For this reason,
it is important to note that a replica shard is never allocated on the same node as the original/primary shard that it was copied from.
It allows you to scale out your search volume/throughput since searches can be executed on all replicas in parallel.
## 5.Analyzers:
Analyzers are used during indexing to break down phrases or expressions into terms.
Defined within an index, an analyzer consists of a single tokenizer and any number of token filters.
For example, a tokenizer could split a string into specifically defined terms when encountering a specific expression.

A token filter is used to filter or modify some tokens. For example, a ASCII folding filter will convert characters like ê, é, è to e.
example:
```
curl -XPUT localhost:9200/example -d ‘{
“mappings”: {
“mytype”: {
“properties”: {
“name”: {
“type”: “string”,
“analyzer”: “whitespace”
}
}
}
}
}’
```
## 6.Nodes:
The heart of any ELK setup is the Elasticsearch instance, which has the crucial task of storing and indexing data.

In a cluster, different responsibilities are assigned to the various node types:
1.Data nodes — stores data and executes data-related operations such as search and aggregation.
2.Master nodes — in charge of cluster-wide management and configuration actions such as adding and removing nodes
3.Client nodes — forwards cluster requests to the master node and data-related requests to data nodes
4.Tribe nodes — act as a client node, performing read and write operations against all of the nodes in the cluster
5.Ingestion nodes (this is new in Elasticsearch 5.0) — for pre-processing documents before indexing

By default, each node is automatically assigned a unique identifier, or name, that is used for management purposes and becomes even more important in a multi-node, or clustered, environment.

When installed, a single node will form a new single-node cluster entitled elasticsearch,” but it can also be configured to join an existing cluster (see below) using the cluster name.

In a development or testing environment, you can set up multiple nodes on a single server.
In production, however, due to the number of resources that an Elasticsearch node consumes,
it is recommended to have each Elasticsearch instance run on a separate server.

## 7.Cluster:
An Elasticsearch cluster is comprised of one or more Elasticsearch nodes.
As with nodes, each cluster has a unique identifier that must be used by any node attempting to join the cluster.
By default, the cluster name is “elasticsearch,” but this name can be changed, of course.

One node in the cluster is the “master” node, which is in charge of cluster-wide management and configurations actions (such as adding and removing nodes).

This node is chosen automatically by the cluster, but it can be changed if it fails. (See above on the other types of nodes in a cluster.)

For example, the cluster health API returns health status reports of either “green” (all shards are allocated), “yellow” (the primary shard is allocated but replicas are not), or “red” (the shard is not allocated in the cluster).

## Output Example
```
{
“cluster_name” : “elasticsearch”,
“status” : “yellow”,
“timed_out” : false,
“number_of_nodes” : 1,
“number_of_data_nodes” : 1,
“active_primary_shards” : 5,
“active_shards” : 5,
“relocating_shards” : 0,
“initializing_shards” : 0,
“unassigned_shards” : 5,
“delayed_unassigned_shards” : 0,
“number_of_pending_tasks” : 0,
“number_of_in_flight_fetch” : 0,
“task_max_waiting_in_queue_millis” : 0,
“active_shards_percent_as_number” : 50.0
}
```
# ELK Installation:
Our Goal:

The goal of the tutorial is to set up Logstash to gather syslogs of multiple servers, and set up Kibana to visualize the gathered logs.

Our ELK stack setup has four main components:

Logstash: The server component of Logstash that processes incoming logs
Elasticsearch: Stores all of the logs
Kibana: Web interface for searching and visualizing logs, which will be proxied through Nginx
Filebeat: Installed on client servers that will send their logs to Logstash, Filebeat serves as a log shipping agent that utilizes the lumberjack networking protocol to communicate with Logstash
![elkarch](/images/2020/ELK_Architecture.png)

NOTE:

We will install the first three components on a single server, which we will refer to as our ELK Server. Filebeat will be installed on all of the client servers that we want to gather logs for, which we will refer to collectively as our Client Servers.

## Pre-requisites:
The amount of CPU, RAM, and storage that your ELK Server will require depends on the volume of logs that you intend to gather. For this tutorial, we will be using a VPS with the following specs for our ELK Server:

OS: Ubuntu 14.04
RAM: 4GB
CPU: 2
In addition to your ELK Server, you will want to have a few other servers that you will gather logs from.

Let’s get started on setting up our ELK Server!

# Step-1 : Install Java8
Elasticsearch and Logstash require Java, so we will install that now. We will install a recent version of Oracle Java 8 because that is what Elasticsearch recommends. It should, however, work fine with OpenJDK, if you decide to go that route.

Add the Oracle Java PPA to apt:
```
$ sudo add-apt-repository -y ppa:webupd8team/java
```
Update your apt package database:
```
$ sudo apt-get update -y
```
Install the latest stable version of Oracle Java 8 with this command (and accept the license agreement that pops up):
```
$ sudo apt-get -y install oracle-java8-installer
```
Now that Java 8 is installed.

let’s install ElasticSearch.

# Step-2: Install ElasticSearch
Elasticsearch can be installed with a package manager by adding Elastic’s package source list.

Run the following command to import the Elasticsearch public GPG key into apt:
```
$ wget -qO – https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add –
```
If your prompt is just hanging there, it is probably waiting for your user’s password (to authorize the sudocommand). If this is the case, enter your password.

Create the Elasticsearch source list:
```
$ echo “deb http://packages.elastic.co/elasticsearch/2.x/debian stable main” | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
```
Update your apt package database:
```
$ sudo apt-get update -y
```
Install Elasticsearch with this command:
```
$ sudo apt-get -y install elasticsearch
```
Elasticsearch is now installed. Let’s edit the configuration:
```
$ sudo vi /etc/elasticsearch/elasticsearch.yml
```
You will want to restrict outside access to your Elasticsearch instance (port 9200), so outsiders can’t read your data or shutdown your Elasticsearch cluster through the HTTP API. Find the line that specifies network.host, uncomment it, and replace its value with “localhost” so it looks like this:

elasticsearch.yml excerpt (updated)
```
network.host: localhost
```
Save and exit elasticsearch.yml.

Now start Elasticsearch:
```
$ sudo service elasticsearch restart
```
Then run the following command to start Elasticsearch on boot up:
```
$ sudo update-rc.d elasticsearch defaults 95 10
```
Now that Elasticsearch is up and running, let’s install Kibana.

# Step-3:Install Kibana
Kibana can be installed with a package manager by adding Elastic’s package source list.

Create the Kibana source list:
```
$ echo “deb http://packages.elastic.co/kibana/4.5/debian stable main” | sudo tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
```
Update your apt package database:
```
sudo apt-get update -y
```
Install Kibana with this command:
```
sudo apt-get -y install kibana
```
Kibana is now installed.

Open the Kibana configuration file for editing:
```
$ sudo vi /opt/kibana/config/kibana.yml
```
In the Kibana configuration file, find the line that specifies server.host, and replace the IP address (“0.0.0.0” by default) with “localhost”:
```
server.host: "localhost"
```
Save and exit. This setting makes it so Kibana will only be accessible to the localhost. This is fine because we will use an Nginx reverse proxy to allow external access.

Now enable the Kibana service, and start it:
```
sudo update-rc.d kibana defaults 96 9
sudo service kibana start
```
Before we can use the Kibana web interface, we have to set up a reverse proxy. Let’s do that now, with Nginx.

# Step-4:Install Nginx
Because we configured Kibana to listen on localhost, we must set up a reverse proxy to allow external access to it. We will use Nginx for this purpose.

Note: If you already have an Nginx instance that you want to use, feel free to use that instead. Just make sure to configure Kibana so it is reachable by your Nginx server (you probably want to change the hostvalue, in /opt/kibana/config/kibana.yml, to your Kibana server’s private IP address or hostname). Also, it is recommended that you enable SSL/TLS.

Use apt to install Nginx and Apache2-utils:
```
$ sudo apt-get install nginx apache2-utils -y
```
Use htpasswd to create an admin user, called “kibanaadmin” (you should use another name), that can access the Kibana web interface:
```
$ sudo htpasswd -c /etc/nginx/htpasswd.users kibanaadmin
```
Enter a password at the prompt. Remember this login, as you will need it to access the Kibana web interface.

Now open the Nginx default server block in your favorite editor. We will use vi:
```
$ sudo vim /etc/nginx/sites-available/default
```
Delete the file’s contents, and paste the following code block into the file. Be sure to update the server_name to match your server’s name:
```
server {

listen 80;

server_name example.com;

auth_basic “Restricted Access”;

auth_basic_user_file /etc/nginx/htpasswd.users;

location / {

proxy_pass http://localhost:5601;

proxy_http_version 1.1;

proxy_set_header Upgrade $http_upgrade;

proxy_set_header Connection ‘upgrade’;

proxy_set_header Host $host;

proxy_cache_bypass $http_upgrade;

}

}
```
Nginx configuration look like :

![nginx](/images/2020/nginx.png)

 

Save and exit. This configures Nginx to direct your server’s HTTP traffic to the Kibana application, which is listening on localhost:5601. Also, Nginx will use the htpasswd.users file, that we created earlier, and require basic authentication.

Now restart Nginx to put our changes into effect:
```
$ sudo service nginx restart
```
Kibana is now accessible via your FQDN or the public IP address of your ELK Server i.e. http://elk-server-public-ip/. If you go there in a web browser, after entering the “kibanaadmin” credentials, you should see a Kibana welcome page which will ask you to configure an index pattern. Let’s get back to that later, after we install all of the other components.

# Step-5 Install Logstash
The Logstash package is available from the same repository as Elasticsearch, and we already installed that public key, so let’s create the Logstash source list:
```
$ echo ‘deb http://packages.elastic.co/logstash/2.2/debian stable main’ | sudo tee /etc/apt/sources.list.d/logstash-2.2.x.list
```
Update your apt package database:
```
$ sudo apt-get update -y
```
Install Logstash with this command:
```
$ sudo apt-get install logstash -y
```
Logstash is installed but it is not configured yet.
Since we are going to use Filebeat to ship logs from our Client Servers to our ELK Server, we need to create an SSL certificate and key pair. The certificate is used by Filebeat to verify the identity of ELK Server. Create the directories that will store the certificate and private key with the following commands:
```
sudo mkdir -p /etc/pki/tls/certs
sudo mkdir /etc/pki/tls/private
```
Now you have two options for generating your SSL certificates. If you have a DNS setup that will allow your client servers to resolve the IP address of the ELK Server, use Option 2. Otherwise, Option 1 will allow you to use IP addresses.

## Option 1:IP Address
If you don’t have a DNS setup—that would allow your servers, that you will gather logs from, to resolve the IP address of your ELK Server—you will have to add your ELK Server’s private IP address to the subjectAltName (SAN) field of the SSL certificate that we are about to generate. To do so, open the OpenSSL configuration file:
```
$ sudo vim /etc/ssl/openssl.cnf
```
Find the [ v3_ca ] section in the file, and add this line under it (substituting in the ELK Server’s private IP address):
```
subjectAltName = IP: ELK_server_private_IP
```
Save and exit.

Now generate the SSL certificate and private key in the appropriate locations (/etc/pki/tls/), with the following commands:
```
cd /etc/pki/tls
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
```
The logstash-forwarder.crt file will be copied to all of the servers that will send logs to Logstash but we will do that a little later. Let’s complete our Logstash configuration. If you went with this option, skip option 2 and move on to Configure Logstash.

## Option 2: FQDN(DNS)
If you have a DNS setup with your private networking, you should create an A record that contains the ELK Server’s private IP address—this domain name will be used in the next command, to generate the SSL certificate. Alternatively, you can use a record that points to the server’s public IP address. Just be sure that your servers (the ones that you will be gathering logs from) will be able to resolve the domain name to your ELK Server.

Now generate the SSL certificate and private key, in the appropriate locations (/etc/pki/tls/…), with the following command (substitute in the FQDN of the ELK Server):
```
$ cd /etc/pki/tls; sudo openssl req -subj ‘/CN=ELK_server_fqdn/’ -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt
```
The logstash-forwarder.crt file will be copied to all of the servers that will send logs to Logstash but we will do that a little later. Let’s complete our Logstash configuration.

## Configure Logstash

Logstash configuration files are in the JSON-format, and reside in /etc/logstash/conf.d. The configuration consists of three sections: inputs, filters, and outputs.

Let’s create a configuration file called 02-beats-input.conf and set up our “filebeat” input:
```
$ sudo vi /etc/logstash/conf.d/02-beats-input.conf
Insert the following input configuration:

input {

beats {

port => 5044

ssl => true

ssl_certificate => “/etc/pki/tls/certs/logstash-forwarder.crt”

ssl_key => “/etc/pki/tls/private/logstash-forwarder.key”

}

}
```
Or

02-beats-input.conf file content looks like:

![logstash1](/images/2020/logstash1.png)

Save and quit. This specifies a beats input that will listen on tcp port 5044, and it will use the SSL certificate and private key that we created earlier.

Now let’s create a configuration file called 10-syslog-filter.conf, where we will add a filter for syslog messages:
```
$ sudo vi /etc/logstash/conf.d/10-syslog-filter.conf
filter {

if [type] == “syslog” {

grok {

match => { “message” => “%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}” }

add_field => [ “received_at”, “%{@timestamp}” ]

add_field => [ “received_from”, “%{host}” ]

}

syslog_pri { }

date {

match => [ “syslog_timestamp”, “MMM d HH:mm:ss”, “MMM dd HH:mm:ss” ]

}

}

}
```
Or 10-syslog-filter.conf file content looks like this:

![logstash2](logstash2)

Save and quit. This filter looks for logs that are labeled as “syslog” type (by Filebeat), and it will try to use grok to parse incoming syslog logs to make it structured and query-able.

Lastly, we will create a configuration file called 30-elasticsearch-output.conf:
```
$ sudo vim /etc/logstash/conf.d/30-elasticsearch-output.conf
output {
elasticsearch {

hosts => [“localhost:9200”]
sniffing => true
manage_template => false
index => “%{[@metadata][beat]}-%{+YYYY.MM.dd}”
document_type => “%{[@metadata][type]}”

}

}
```
Or 30-elasticsearch-output.conf file content looks like:

![logstash3](/images/2020/logstash3.png)

Save and exit. This output basically configures Logstash to store the beats data in Elasticsearch which is running at localhost:9200, in an index named after the beat used (filebeat, in our case).

If you want to add filters for other applications that use the Filebeat input, be sure to name the files so they sort between the input and the output configuration (i.e. between 02- and 30-).

Test your Logstash configuration with this command:
```
$ sudo service logstash configtest
```
It should display Configuration OK if there are no syntax errors. Otherwise, try and read the error output to see what’s wrong with your Logstash configuration.

Restart Logstash, and enable it, to put our configuration changes into effect:
```
sudo service logstash restart
sudo update-rc.d logstash defaults 96 9
```
Next, we’ll load the sample Kibana dashboards.

##Loading Sample Kibana Dashboards:

Elastic provides several sample Kibana dashboards and Beats index patterns that can help you get started with Kibana. Although we won’t use the dashboards in this tutorial, we’ll load them anyway so we can use the Filebeat index pattern that it includes.

First, download the sample dashboards archive to your home directory:
```
cd ~
curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.1.0.zip
```
Install the unzip package with this command:
```
sudo apt-get -y install unzip
```
Next, extract the contents of the archive:
```
unzip beats-dashboards-*.zip
```
And load the sample dashboards, visualizations and Beats index patterns into Elasticsearch with these commands:
```
cd beats-dashboards-*
./load.sh
```
These are the index patterns that we just loaded:

[packetbeat-]YYYY.MM.DD
[topbeat-]YYYY.MM.DD
[filebeat-]YYYY.MM.DD
[winlogbeat-]YYYY.MM.DD
When we start using Kibana, we will select the Filebeat index pattern as our default.

Load Filebeat index templates in Elasticsearch
Because we are planning on using Filebeat to ship logs to Elasticsearch, we should load a Filebeat index template. The index template will configure Elasticsearch to analyze incoming Filebeat fields in an intelligent way.

First, download the Filebeat index template to your home directory:
```
cd ~
curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json
```
Then load the template with this command:
```
$ curl -XPUT ‘http://localhost:9200/_template/filebeat?pretty&#8217; -d@filebeat-index-template.json
```

If the template loaded properly, you should see a message like this:

Output:
{
  "acknowledged" : true
}
Now that our ELK Server is ready to receive Filebeat data, let’s move onto setting up Filebeat on each client server.

Step-6: SetUp filebeat(add clients servers)
Do these steps for each Ubuntu or Debian server that you want to send logs to Logstash on your ELK Server. For instructions on installing Filebeat on Red Hat-based Linux distributions (e.g. RHEL, CentOS, etc.), refer to the Set Up Filebeat (Add Client Servers) section of the CentOS variation of this tutorial.

Copy SSL Certificate
On your ELK Server, copy the SSL certificate—created in the prerequisite tutorial—to your Client Server(substitute the client server’s address, and your own login):
```
scp /etc/pki/tls/certs/logstash-forwarder.crt user@client_server_private_address:/tmp
```
After providing your login’s credentials, ensure that the certificate copy was successful. It is required for communication between the client servers and the ELK Server.

Now, on your Client Server, copy the ELK Server’s SSL certificate into the appropriate location (/etc/pki/tls/certs):
```
Client $ sudo mkdir -p /etc/pki/tls/certs
CLient$ sudo cp /tmp/logstash-forwarder.crt /etc/pki/tls/certs/
```
Now we will install the Topbeat package.

Install Filebeat packages:
On Client Server, create the Beats source list,using following command :
```
Client$ echo “deb https://packages.elastic.co/beats/apt stable main” | sudo tee -a /etc/apt/sources.list.d/beats.list
```
It also uses the same GPG key as Elasticsearch, which can be installed with this command:
```
Client$ wget -qO – https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add –
```
Then install the Filebeat package:
```
sudo apt-get update
sudo apt-get install filebeat
Filebeat is installed but it is not configured yet.
```
Configure filebeat
Now we will configure Filebeat to connect to Logstash on our ELK Server. This section will step you through modifying the example configuration file that comes with Filebeat. When you complete the steps, you should have a file that looks something like this.

On Client Server, create and edit Filebeat configuration file:
```
sudo vi /etc/filebeat/filebeat.yml
```
Note: Filebeat’s configuration file is in YAML format, which means that indentation is very important! Be sure to use the same number of spaces that are indicated in these instructions.

Near the top of the file, you will see the prospectors section, which is where you can define prospectorsthat specify which log files should be shipped and how they should be handled. Each prospector is indicated by the - character.

We’ll modify the existing prospector to send syslog and auth.log to Logstash. Under paths, comment out the - `/var/log/*.log` file. This will prevent Filebeat from sending every .log in that directory to Logstash. Then add new entries for syslog and auth.log. It should look something like this when you’re done:
```
...
      paths:
        - /var/log/auth.log
        - /var/log/syslog
#        - /var/log/*.log
...
```
Then find the line that specifies document_type:, uncomment it and change its value to “syslog”. It should look like this after the modification:
```
...
      document_type: syslog
...
```
This specifies that the logs in this prospector are of type syslog (which is the type that our Logstash filter is looking for).

If you want to send other files to your ELK server, or make any changes to how Filebeat handles your logs, feel free to modify or add prospector entries.

Next, under the output section, find the line that says elasticsearch:, which indicates the Elasticsearch output section (which we are not going to use). Delete or comment out the entire Elasticsearch output section (up to the line that says #logstash:).

Find the commented out Logstash output section, indicated by the line that says #logstash:, and uncomment it by deleting the preceding #. In this section, uncomment the hosts: ["localhost:5044"]line. Change localhost to the private IP address (or hostname, if you went with that option) of your ELK server:
```
 ### Logstash as output
  logstash:
    # The Logstash hosts
    hosts: ["ELK_server_private_IP:5044"]
```
This configures Filebeat to connect to Logstash on your ELK Server at port 5044 (the port that we specified a Logstash input for earlier).

Directly under the hosts entry, and with the same indentation, add this line in filebeat.yml file:
```
bulk_max_size: 1024
```
Next, find the tls section, and uncomment it. Then uncomment the line that specifies certificate_authorities, and change its value to ["/etc/pki/tls/certs/logstash-forwarder.crt"]. It should look something like this:
```
...
    tls:
      # List of root certificates for HTTPS server verifications
      certificate_authorities: ["/etc/pki/tls/certs/logstash-forwarder.crt"]
```
This configures Filebeat to use the SSL certificate that we created on the ELK Server.

Save and quit.

Now restart Filebeat to put our changes into place:
```
sudo service filebeat restart
sudo update-rc.d filebeat defaults 95 10
```
Again, if you’re not sure if your Filebeat configuration is correct, compare it against this [example Filebeat configuration](https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/de660ffdd3decacdcaf88109e5683e1eef75c01f/filebeat.yml-ubuntu).

Now Filebeat is sending syslog and auth.log to Logstash on your ELK server! Repeat this section for all of the other servers that you wish to gather logs for.

## Test the filebeat installation:
If your ELK stack is setup properly, Filebeat (on your client server) should be shipping your logs to Logstash on your ELK server. Logstash should be loading the Filebeat data into Elasticsearch in a date-stamped index, filebeat-YYYY.MM.DD.

On your ELK Server, verify that Elasticsearch is indeed receiving the data by querying for the Filebeat index with this command:

`curl -XGET ‘http://localhost:9200/filebeat-*/_search?pretty&#8217;`

You should see a bunch of output that looks like this:

Sample Output:
```
...
{
      "_index" : "filebeat-2016.01.29",
      "_type" : "log",
      "_id" : "AVKO98yuaHvsHQLa53HE",
      "_score" : 1.0,
      "_source":{"message":"Feb  3 14:34:00 rails sshd[963]: Server listening on :: port 22.","@version":"1","@timestamp":"2016-01-29T19:59:09.145Z","beat":{"hostname":"topbeat-u-03","name":"topbeat-u-03"},"count":1,"fields":null,"input_type":"log","offset":70,"source":"/var/log/auth.log","type":"log","host":"topbeat-u-03"}
    }
...
```
If your output shows 0 total hits, Elasticsearch is not loading any logs under the index you searched for, and you should review your setup for errors. If you received the expected output, continue to the next step.

## Connect to Kibana
When you are finished setting up Filebeat on all of the servers that you want to gather logs for, let’s look at Kibana, the web interface that we installed earlier.

example:

http://localhost:5601/         and hit enter

In a web browser, go to the FQDN or public IP address of your ELK Server. After entering the “kibanaadmin” credentials, you should see a page prompting you to configure a default index pattern:

![kibana1](/images/2020/kibana1.png)

Go ahead and select [filebeat]-YYY.MM.DD from the Index Patterns menu (left side), then click the Star (Set as default index) button to set the Filebeat index as the default.

Now click the Discover link in the top navigation bar. By default, this will show you all of the log data over the last 15 minutes. You should see a histogram with log events, with log messages below:

![kibana2](iimages/2020/kibana2.png)

Right now, there won’t be much in there because you are only gathering syslogs from your client servers. Here, you can search and browse through your logs. You can also customize your dashboard.

Try the following things:

Search for “root” to see if anyone is trying to log into your servers as root
Search for a particular hostname (search for host: "hostname")
Change the time frame by selecting an area on the histogram or from the menu above
Click on messages below the histogram to see how the data is being filtered
Kibana has many other features, such as graphing and filtering, so feel free to poke around!

## Conclusion
Now that your syslogs are centralized via Elasticsearch and Logstash, and you are able to visualize them with Kibana, you should be off to a good start with centralizing all of your important logs. Remember that you can send pretty much any type of log or indexed data to Logstash, but the data becomes even more useful if it is parsed and structured with grok.

To improve your new ELK stack, you should look into gathering and filtering your other logs with Logstash, and [creating Kibana dashboards](https://www.digitalocean.com/community/tutorials/how-to-use-kibana-dashboards-and-visualizations). You may also want to [gather system metrics by using Topbeat](https://www.digitalocean.com/community/tutorials/how-to-gather-infrastructure-metrics-with-topbeat-and-elk-on-ubuntu-14-04) with your ELK stack. All of these topics are covered in the other tutorials in this series.

Good luck!

Referensi:

* https://mohitepramod.wordpress.com/2018/06/
* https://logz.io/blog/10-elasticsearch-concepts/
* https://www.elastic.co/guide/en/elasticsearch/reference/current/_basic_concepts.html#_near_realtime_nrt
* https://qbox.io/blog/welcome-to-the-elk-stack-elasticsearch-logstash-kibana
* https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elk-stack-on-centos-7
* https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elk-stack-on-ubuntu-14-04
