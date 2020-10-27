+++
title = "All about icinga monitoring"
date = 2018-04-04T18:45:00Z
updated = 2018-05-28T10:48:44Z
tags = ["linux", "monitoring"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

## icinga2 installation on ubuntu 16

* https://www.icinga.com/docs/icinga2/latest/doc/02-getting-started/
* https://www.icinga.com/docs/icingaweb2/latest/doc/02-Installation/
* https://www.rosehosting.com/blog/install-icinga-2-on-ubuntu-16-04/
* https://blog.x-toolz.com/installing-icinga2-icingaweb2-on-ubuntu-16-04-3-lts/
* https://github.com/jpfluger/examples/blob/master/ubuntu-14.04/icinga2-server.md
* https://www.google.co.id/search?q=icinga2+change+ssh+port
* https://monitoring-portal.org/woltlab/index.php?thread/32752-ssh-monitoring-different-port/

added a line into the servicedefinition:
Code
apply Service "ssh" {
import "generic-service"
check_command = "ssh"
vars.port = host.vars.ssh_port
assign where host.address && host.vars.os == "Linux"
ignore where host.name == "localhost" /* for upgrade safety */
}

and in the hostdef:
Code
object Host "webarchiv" {
vars.ssh_port = 1023
}
