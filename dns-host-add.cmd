call AAA-Log %0 %*


:MAIN
	if "%2"=="" ( AAA-Obs %0 )
	AAA-Obs %0

	echo %1 %2 %windir%\System32\drivers\etc\hosts

	exit /b


:OBS
>dhcp-
>net-
>ip-

	dns-host-add <name> <ip>
	
	SAMPLE:
	=======
	dns-host-add kali 172.24.42.20


