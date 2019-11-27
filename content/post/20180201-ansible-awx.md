+++
title = "Ansible AWX"
date = 2018-01-31T20:54:00Z
updated = 2018-02-14T03:41:32Z
tags = ["task", "todo"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

# DEPRECATED

### install latest ansible
```
apt-add-repository ppa:ansible/ansible
[ENTER]
apt update
apt-get install ansible
```
### install latest docker
```
apt-add-repository ppa:ansible/ansible
[ENTER]
apt update
apt-get install ansible
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt update
apt-get install docker-ce
apt install make
apt install python-pip
pip install docker
pip install --upgrade pip
apt install git
curl -O https://raw.githubusercontent.com/geerlingguy/awx-container/master/docker-compose.yml
docker-compose up -d
```
tunggu beberapa saat lalu akses via http, misal http://localhost dengan user admin/password

Ref:

* http://www.nalashaa.com/setting-ci-deployment-automation-ansible/
* https://chromatichq.com/blog/automated-servers-and-deployments-ansible-jenkins
* https://medium.com/@tedchength/basic-deployment-with-ansible-docker-jenkins-and-git-4f3b42fb2f5e
* https://dzone.com/articles/running-ansible-playbooks-from-jenkins
* https://www.jeffgeerling.com/blog/2017/get-started-using-ansible-awx-open-source-tower-version-one-minute
* https://galaxy.ansible.com/geerlingguy/jenkins/

## Belajar ansible awx 201802010830

Ref:

* https://www.youtube.com/watch?v=E5XtK7mE8_0
* https://github.com/whiskerlabs/armsible/blob/master/local_network_inventory.py
* https://github.com/KeksiLabs/ansible-user-management-example
* https://keksi.io/tutorials/2016/12/05/how-to-manage-remote-server-users-with-ansible/

## install ansible tower

Ref:

* https://rafishaikblog.wordpress.com/2017/01/31/ansible-tower/

Ansible tower

Ref:

* https://oliverveits.wordpress.com/2016/06/14/it-automation-part-iv-ansible-tower-hello-world-example/amp/

