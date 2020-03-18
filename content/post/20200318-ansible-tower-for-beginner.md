---
title: "Ansible Tower for beginner"
date: 2020-03-18T13:47:54+07:00
tags: ["linux", "ansible", "ansibletower", "tips"]
author: "Widya"
draft: false
---
Before going to start the installation steps, we need to know some benefits of Ansible Tower.

# Why we need Ansible Tower and it’s benefits?

1. Ansible Tower helps you scale IT automation, manage complex deployments and speed productivity.

2. Centralize and control your IT infrastructure with a visual dashboard, role-based access control, job scheduling, integrated notifications and graphical inventory management.

3. Ansible Tower’s REST API and CLI make it easy to embed Ansible Tower into existing  tools and processes.

4. The Ansible Tower dashboard provides a heads-up NOC-style display for everything  going on in your Ansible environment.

5. As soon as you log in, you’ll see your host and inventory status, all the recent job activity and a snapshot of recent job runs. Adjust your job status settings to graph data from specific job and time ranges.

6. We can get Real-Time Job Status update:

Within Ansible Tower, playbook runs stream by in real time. As Ansible automates across your infrastructure, you’ll see plays and tasks complete, broken down by each machine, and each success or failure, complete with output. Easily see the status of your automation, and what’s next in the queue.

Other types of jobs, such as source control updates or cloud inventory refreshes, appear in the common job view. Know what Ansible Tower is up to at any time.

7. Multi-Playbook Workflows:

Ansible Tower Workflows allow you to easily model complex processes with Ansible Tower’s intuitive workflow editor. Ansible Tower workflows chain any number of playbooks, updates, and other workflows, regardless of whether they use different inventories, run as different users, run at once or utilize different credentials.

You can build a provisioning workflow that provisions machines, applies a base system configuration, and deploys an application, all with different playbooks maintained by different teams. You can build a CI/CD testing workflow that builds an application, deploys it to a test environment, runs tests, and automatically promotes the application based on test results. Set up different playbooks to run in case of success or failure of a prior workflow playbook.

8. Who Ran What Job When:

With Ansible Tower, all automation activity is securely logged. Who ran it, how they customized it, what it did, where it happened – all securely stored and viewable later, or exported through Ansible Tower’s API.

Activity streams extend this by showing a complete audit trail of all changes made to Ansible Tower itself – job creation, inventory changes, credential storage, all securely tracked.

All audit and log information can be sent to your external logging and analytics provider to perform analysis of automation and event correlation   across your entire environment.

9. Ansible Tower allows us to easily streamline the delivery of applications and services to both OpenStack and Amazon Clouds in a cost effective, simple, and secure manner.

10. Scale Capacity With Tower Clusters:

Connect multiple Ansible Tower nodes into a Ansible Tower cluster. Ansible Tower clusters add redundancy and capacity, allowing you to scale Ansible automation across your enterprise, including with reserved capacity for certain teams and jobs, and remote execution for access across network zones.

11. Integrated Notifications:

Stay informed of your automation status via integrated notifications.

Notify a person or team when your job succeeds, or escalate when jobs fail. Send notifications across your entire organization at once, or customize on a per- job basis.

Connect your notifications to Slack, Hipchat, PagerDuty, SMS, email, and more – or post notifications to a custom webhook to trigger other tools in your infrastructure.

12. Schedule Ansible Jobs:

Playbook runs, cloud inventory updates, and source control updates can be scheduled inside Ansible Tower – run now, run later, or run forever.

Set up occasional tasks like nightly backups, periodic configuration remediation for compliance, or a full continuous delivery pipeline with just a few clicks.

13. Manage And Track Your Entire Inventory:

Ansible Tower helps you manage your entire infrastructure. Easily pull your  inventory from public cloud providers such as Amazon Web Services, Microsoft Azure, and more, or synchronize from your local OpenStack cloud or VMware environment. Connect your inventory directly to your Red Hat Satellite or Red Hat CloudForms environment, or your custom CMDB.

Ansible Tower can keep your cloud inventory in sync, and Ansible Tower’s powerful provisioning callbacks allow nodes to request configuration on demand, enabling autoscaling. You can also see alerts from Red Hat Insights directly from Ansible Tower, and use Insights-provided Playbook Remediation to fix issues in your infrastructure.

Plus, Ansible Tower Smart Inventories allow you to organize and automate hosts across all your providers based on a powerful host fact query engine.

14. Remote Command Execution:

Run simple tasks on any host or group of hosts in your inventory with Ansible Tower’s remote command execution. Add users or groups, reset passwords, restart a malfunctioning service or patch a critical security issue, quickly. As always, remote command execution uses Ansible Tower’s role-based access control engine and logs every action.

15. Comprehensive Rest API And Tower CLI Tool:

Far from being limited to just the user interface, every feature of Ansible Tower is available via Ansible Tower’s REST API, providing the ideal API for a systems management infrastructure to build against. Call Ansible Tower jobs from your build tools, show Ansible Tower information in your custom dashboards and more. Get API usage information and best practices with built-in documentation.

## Prerequisites:
Ansible Tower server (I’m using a VMware environment, so both my servers are VMs)

1 Core, 1GB RAM Ubuntu 12.04 LTS Server, 64-bit

Active Directory Server (I’m using Windows Server 2012 R2)

2 Cores, 4GB RAM

Officially, Tower supports CentOS 6, RedHat Enterprise Linux 6, Ubuntu Server 12.04 LTS, and Ubuntu Server 14.04 LTS.

Installing Tower requires Internet connectivity, because it downloads from their repo servers.

I have managed to perform an offline installation, but you have to set up some kind of system to mirror their repositories, and change some settings in the Ansible Installer file.

I *highly* recommend you dedicate a server (vm or otherwise) to Ansible Tower, because the installer will rewrite pg_hba.conf and supervisord.conf to suit its needs.  Everything is easier if you give it it’s own environment to run in.

You *might* be able to do it in Docker, although I haven’t tried, and I’m willing to bet you’re asking for trouble.

I’m going to assume you already know about installing Windows Server 2012 and building a domain controller. (If there’s significant call for it, I might write a separate blog post about this…)

 

# Installation Steps:
## Step – 1:
Download the latest .tar file from ‘https://releases.ansible.com/ansible-tower/setup/&#8217;

## Step – 2:
Now untar the downloaded .tar file using below command:

[devops@localhost ~]$ tar xvzf ansible-tower-setup-latest.tar.gz
## Step – 3:
goto “ansible-tower-setup-<VERSION>” directory

[devops@localhost ~]$ cd ansible-tower-setup-3.4.0-2

## Step – 4:
edit inventory file which is present inside “ansible-tower-setup-3.4.0-2″ directory.

Put the below content to inventory file:
```
# /home/ubuntu/ansible-tower-setup-3.2.5/inventory file content

[tower]
localhost ansible_connection=local

[database]

[all:vars]
admin_password=’admin’

pg_host=”
pg_port=”

pg_database=’awx’
pg_username=’awx’
pg_password=’admin’

rabbitmq_port=5672
rabbitmq_vhost=tower
rabbitmq_username=tower
rabbitmq_password=’admin’
rabbitmq_cookie=cookiemonster

# Needs to be true for fqdns and ip addresses
rabbitmq_use_long_name=false

# Isolated Tower nodes automatically generate an RSA key for authentication;
# To disable this behavior, set this value to false
# isolated_key_generation=true
################################# Up to here ########################
```
## Step – 5:
Now Run the ansible-tower setup by using below command:

[devops@localhost ansible-tower-setup-3.4.0-2]$ sudo ansible-playbook -i inventory install.yml
[INFO]  To Run Above command we should have ansible installed on this server

[INFO]  If ansible is not present then please open the below link and install the ansible:

[INFO]  https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7

 

[INFO] SetUp will take approx 45 mins or more.

Sample Output:
```
[sudo] password for devops:
[WARNING]: Could not match supplied host pattern, ignoring: instance_group_*
PLAY [tower:database:instance_group_*] ******************************************************************************************************************************

TASK [check_config_static : Ensure expected variables are defined] **************************************************************************************************
skipping: [localhost] => (item=tower_package_name)
skipping: [localhost] => (item=tower_package_version)
skipping: [localhost] => (item=tower_package_release)

TASK [check_config_static : Detect unsupported HA inventory file] ***************************************************************************************************
skipping: [localhost]

TASK [check_config_static : Ensure at least one tower host is defined] **********************************************************************************************
skipping: [localhost]

TASK [check_config_static : Ensure only one database host exists] ***************************************************************************************************
skipping: [localhost]

TASK [check_config_static : Ensure when postgres host is defined that the port is defined] **************************************************************************
skipping: [localhost]

TASK [check_config_static : Ensure that when a database host is specified, that pg_host is defined] *****************************************************************
skipping: [localhost]

TASK [check_config_static : Ensure that when a database host is specified, that pg_port is defined] *****************************************************************
skipping: [localhost]

TASK [check_config_static : HA mode requires an external postgres database with pg_host defined] ********************************************************************
skipping: [localhost]

TASK [check_config_static : HA mode requires an external postgres database with pg_port defined] ********************************************************************
skipping: [localhost]

TASK [config_dynamic : Set database to internal or external] ********************************************************************************************************
ok: [localhost]

TASK [config_dynamic : Database decision] ***************************************************************************************************************************
ok: [localhost] => {
“config_dynamic_database”: “internal”
}

TASK [config_dynamic : Set postgres host and port to local if not set] **********************************************************************************************
ok: [localhost]

TASK [config_dynamic : Ensure connectivity to hosts and gather facts] ***********************************************************************************************
ok: [localhost]

TASK [config_dynamic : Get effective uid] ***************************************************************************************************************************
changed: [localhost]

TASK [config_dynamic : Ensure user is root] *************************************************************************************************************************
skipping: [localhost]

PLAY [Group nodes by OS distribution] *******************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************
ok: [localhost]

TASK [group hosts by distribution] **********************************************************************************************************************************
ok: [localhost]
[WARNING]: Could not match supplied host pattern, ignoring: RedHat-7*

[WARNING]: Could not match supplied host pattern, ignoring: Ubuntu-16.04

[WARNING]: Could not match supplied host pattern, ignoring: OracleLinux-7*
PLAY [Group supported distributions] ********************************************************************************************************************************

TASK [group hosts for supported distributions] **********************************************************************************************************************
ok: [localhost]
[WARNING]: Could not match supplied host pattern, ignoring: none

.

.

.

.

TASK [misc : Create the default organization if it is needed.] ******************************************************************************************************
changed: [localhost]

RUNNING HANDLER [supervisor : restart supervisor] *******************************************************************************************************************
changed: [localhost] => {
“msg”: “Restarting supervisor.”
}

RUNNING HANDLER [supervisor : Stop supervisor.] *********************************************************************************************************************
changed: [localhost]

RUNNING HANDLER [supervisor : Wait for supervisor to stop.] *********************************************************************************************************
ok: [localhost]

RUNNING HANDLER [supervisor : Start supervisor.] ********************************************************************************************************************
changed: [localhost]

RUNNING HANDLER [nginx : restart nginx] *****************************************************************************************************************************
changed: [localhost]

PLAY [Install Tower isolated node(s)] *******************************************************************************************************************************
skipping: no hosts matched

PLAY RECAP **********************************************************************************************************************************************************
localhost : ok=139 changed=65 unreachable=0 failed=0

########### Sample Output Ends Here ############
```
## Step – 6: Now, open browser and type below:
https://Your-Server-IP-Address  and hit enter.

Example:

https://192.168.56.102

1.Browser_Proceed_unsafe.png

 

Now, Click on –> Advance–>click on–>proceed to <192.168.56.102> –>It will show as below

 

 

It will automatically redirect to Ansible Tower page(as shown below)

2.Login_Page_on_browser.png

Now, Put your username and password(which you have provided in “/home/ubuntu/ansible-tower-setup-3.2.5/inventory” file)

And click on “SIGN IN” button.

After logged-in successfully, It will ask for license.Please click on “REQUEST LICENSE”3.Request_license.png

It will take to you on ansible tower license request page.Please select the appropriate options and fill the all mandatory fields and click on “Submit” button as shown below:

4.Redirect_to_get_license_after_filling_proper_details_main.png

After Click on “Submit” button, it will send the license file to your mail within 1 business day. Please check the mail.

After getting the license file, Please open the Ansible tower and do below things which are marked as Orange Square:

![license](/images/2020/3.1browse_license_file.png)

And click on “Submit” button.

After successful submission, It will show you the Ansible Tower Dashboard as shown below:

![login](/images/2020/5.After_successful_login_first_page_view.png)

Finally, You have successful Ansible Tower installation on Centos 7 Machine.

In the next blog we will see how to run the first playbook from Ansible Tower.

Referensi:

* https://mohitepramod.wordpress.com/2019/01/19/ansible-tower-installation/
* https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7
* https://releases.ansible.com/ansible-tower/docs/tower_user_guide-2.1.6.pdf

