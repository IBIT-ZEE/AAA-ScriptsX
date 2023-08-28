call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>arp-
>net-
>ip-

	Tip:
	
	netsh interface set interface LAN1 enable
	netsh interface set interface "vEthernet (Default Switch)" enable
