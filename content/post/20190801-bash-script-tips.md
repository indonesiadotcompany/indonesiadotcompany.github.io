+++
title = "Bash script tips"
date = 2018-02-04T23:20:00Z
updated = 2019-08-01T20:53:19Z
tags = ["linux", "scripts", "bash"]
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

## Bash scripting cheatsheet

Referensi:

* https://devhints.io/bash


## bash or and

### How to Use Logical OR &amp; AND in Shell Script with Examples

Logical **OR** &amp; **AND** operations are very useful where multiple conditions are used in our programs (scripts).

* OR is used between two or multiple conditions. It returns true if any one of conditions returns as true.
* AND is used between two or multiple conditions. It returns true only if all the conditions returns as true.

### Using Logical OR
Logical OR in bash script is used with operator -o. Below small shell script will show you to how to use logical OR ( -o ) between two conditions.
```
#!/bin/bash
read -p "Enter First Numeric Value: "   first
read -p "Enter Second Numeric Value: "  second

if [ $first -le 10 -o $second -gt 20 ]
then
 echo "OK"
else
 echo "Not OK"
fi
```
### Using Logical AND
Logical AND in bash script is used with operator -a. Below shell script will show you to how to use logical AND ( -a ) between two conditions.
```
#!/bin/bash
read -p "Enter First Numeric Value: "   first
read -p "Enter Second Numeric Value: "  second
if [ $first -le 10 -a $second -gt 20 ]
then
 echo "OK"
else
 echo "Not OK"
fi
```

### Using Multiple Logical OR &amp; AND
Below example will help you to understand to how to use multiple logical operators in single statement.
```
#!/bin/bash
read -p "Enter Your Number:"  i
if [ ( $i -ge 10  -a  $i -le 20 ) -o ( $i -ge 100  -a  $i -le 200 ) ]
then
 echo "OK"
else
 echo "Not OK"
fi
```

Ref:

* https://tecadmin.net/use-logical-or-and-in-shell-script/#

## insert variable to bash script using **source**

Referensi:

* https://bash.cyberciti.biz/guide/Source_command

## Pass Arguments / Parameters to a bash script

Referensi:

* http://linuxcommand.org/lc3_wss0120.php
* https://www.adminschoice.com/bash-positional-parameters
* https://www.lifewire.com/pass-arguments-to-bash-script-2200571

