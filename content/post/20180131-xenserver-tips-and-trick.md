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

## xenserver resize memory command

Increase RAM for XenServer VM's through Command Line Interface.
1. If the RAM editing option is graded out through XenCenter.

Solution:
1. Take a putty/ssh connection to pool master
2. Power off the VM.

Execute the Below command to configure the new RAM:
```
#xe vm-memory-limits-set uuid=<uuid of="" the="" valid="" vm=""> static-min=<nn>GiB/MiB dynamic-min=<nn>GiB/MiB dynamic-max=<nn>GiB/MiB static-max=<nn>GiB/MiB </nn></nn></nn></nn></uuid>
```
Example :
```
#xe vm-memory-limits-set uuid=120513b6-68ec-c0eb-ba87-b4936bbbc66f static-min=64GiB dynamic-min=64GiB dynamic-max=64GiB static-max=64GiB
```

3. Start the VM.
