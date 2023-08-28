

:MAIN
	@echo off
	AAA-Obs %0
	exit /b

:OBS
	ATT***
	if DNS IP-Address is not local
	the Interface/NIC must have a default route to it (Gateway)

	netsh interface ip set dns name="LAN1" static 10.0.0.254
	netsh interface ip set dns name="LAN1" static 10.0.1.254
	
	netsh interface ip set dns name="LAN1" static 1.1.1.1
	netsh interface ip set dns name="LAN1" static 8.8.8.8
	netsh interface ip set dns name="LAN1" static 8.8.8.8 index=2


