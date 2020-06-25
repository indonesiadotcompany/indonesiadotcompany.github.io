---
title: "Ansible to Windows via winrm"
date: 2020-06-24T08:17:54+07:00
tags: ["linux", "ansible", "windows", "winrm"]
author: "Widya"
draft: false
---

## Prerequisites on windows

### Upgrading PowerShell and .NET Framework
https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html

Buka powershell sebagai administrator, lalu copy paste bagian berikut:

```
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
$file = "$env:temp\Upgrade-PowerShell.ps1"
$username = "Administrator"
$password = "Password"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# Version can be 3.0, 4.0 or 5.1
&$file -Version 5.1 -Username $username -Password $password -Verbose
```

Once completed, you will need to remove auto logon and set the execution policy back to the default of Restricted. You can do this with the following PowerShell commands:
```
# This isn't needed but is a good security practice to complete
Set-ExecutionPolicy -ExecutionPolicy Restricted -Force

$reg_winlogon_path = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $reg_winlogon_path -Name AutoAdminLogon -Value 0
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultUserName -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $reg_winlogon_path -Name DefaultPassword -ErrorAction SilentlyContinue
```

### Windows preparation
https://medium.com/the-sysadmin/managing-windows-machines-with-ansible-60395445069f

Buka cmd (command prompt) sebagai administrator, lalu copy paste bagian berikut:
```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))"
```

### Prerequisites di sisi ansible engine
https://stackoverflow.com/questions/51633907/msg-winrm-or-requests-is-not-installed-no-module-named-xmltodict

```
pip install --ignore-installed pywinrm
```

### inventory ansible
https://geekflare.com/connecting-windows-ansible-from-ubuntu/

```
[windows]
10.11.8.102 ansible_user=ansible ansible_password=pwdansibl3 ansible_winrm_port=5986 ansible_connection=winrm ansible_winrm_server_cert_validation=ignore
```

### test it
```
ansible windows -m win_ping
```

### note
```
ansible.cfg
[defaults]
inventory = ./inventory
```

### win chocolatey untuk install aplikasi
https://chocolatey.org/docs/installation

install terlebih dahulu chocolatey di windows dengan command:
```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

lalu test install beberapa aplikasi dengan ansible ad-hoc command:
```
ansible windows -m win_chocolatey -a "name=putty state=present"
ansible windows -m win_chocolatey -a "name=git state=present"
ansible windows -m win_chocolatey -a "name=7zip state=present"
```

### 
Referensi:

* https://github.com/jborean93/ansible-windows/tree/master/scripts
* https://docs.ansible.com/ansible/latest/modules/list_of_windows_modules.html
* https://docs.ansible.com/ansible/latest/modules/win_chocolatey_module.html#win-chocolatey-module

