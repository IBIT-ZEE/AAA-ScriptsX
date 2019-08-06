aaa-mainX.cmd %~n0

:OBS
// WINRM $

TCP 5985/HTTP and 5986/HTTPS
net start/stop winrm

* NET-PROFILE must be private (Get/Set-Netprofile)
* FIREWALL must be open to winrm (WinRM QC / Enable-PSRemoting)
* TRUSTEDHOSTS must contain remote host (winrm set winrm/config/client/...)

winrm set winrm/config/client @{TrustedHosts="ZEE-PC, ZEE-OEM, vmWork"}

:: TRUSTED-HOSTS manage

:
