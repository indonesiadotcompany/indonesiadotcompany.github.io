+++
title = "Xenserver tips and trick"
date = 2018-01-31T21:30:00Z
updated = 2018-02-01T21:15:08Z
tags = ["xenserver", "vps", "cloud", "vm"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

<b>xenserver resize memory command</b><br /><br />Increase RAM for XenServer VM's through Command Line Interface.<br /><br />1.If the RAM editing option is graded out through XenCenter.<br />Solution<br />1.Take a putty/ssh connection to pool master<br /><br />2.Power off the VM.<br /><br />Execute the Below command to configure the new RAM:<br /><br />#xe vm-memory-limits-set &nbsp; &nbsp;uuid=<uuid of="" the="" valid="" vm=""> &nbsp; static-min=<nn>GiB/MiB &nbsp;dynamic-min=<nn>GiB/MiB &nbsp;dynamic-max=<nn>GiB/MiB &nbsp; &nbsp; static-max=<nn>GiB/MiB&nbsp;</nn></nn></nn></nn></uuid><br /><br />Example :<br />#xe vm-memory-limits-set &nbsp; &nbsp;uuid=120513b6-68ec-c0eb-ba87-b4936bbbc66f &nbsp; &nbsp; &nbsp;static-min=64GiB &nbsp; dynamic-min=64GiB &nbsp; dynamic-max=64GiB &nbsp; &nbsp;static-max=64GiB<br /><br />3.Start the VM.<br /><div><br /></div>
