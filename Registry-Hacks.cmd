Call AAA-Log %0 %*
grep -iP -A 9999 "^///REGISTRY-HACKS" %~f0
exit /b

:OBS
///REGISTRY-HACKS
// HIDE-OEM
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList
	OEM=dword:0


// ADMINISTRATIVE SHARES UNLOCK * Windows 7/8/2008/2012
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
	LocalAccountTokenFilterPolicy=1/DWORD32
+
// ADMINISTRATIVE SHARES UNLOCK * windows 10/2016/2019
HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters
	AllowInsecureGuestAuth=1/DWORD32

