

:MAIN
	echo off
	if "%~1"=="" AAA-Obs %0

	netsh interface ip show dns | grep -A 2 %1

	exit /b


:OBS
	Syntax

		DNS-ListX <nic-name>


	// Examples:
	DNS-List LAN0
	DNS-List VPN
	DNS-List WIFI


