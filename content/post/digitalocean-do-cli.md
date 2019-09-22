+++
title = "digitalocean DO cli"
date = 2018-03-04T20:58:00Z
updated = 2018-03-04T20:58:58Z
tags = ["digitalocean", "cli"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

<b>digitalocean snapshot and recreate based on that snapshot (clone like)</b><br /><br />doctl compute droplet-action snapshot <i>DropletID</i> --snapshot-name <i>SnapshotName</i><br />doctl compute droplet-action snapshot 83360000 --snapshot-name 20180303-birau-snap<br /><br />doctl compute droplet create <i>NewDropletName</i> --size 512mb --image <i>SnapshotID</i> --region sgp1 --ssh-keys <i>Ssh:key:hexadecimal</i><br /><br />doctl compute droplet create birau-server-2 --size 512mb --image 32187000 --region sgp1 --ssh-keys b0:10:00:d6:8b:00:4f:96:39:1b:89:00:00:00:00:00<br /><br />
