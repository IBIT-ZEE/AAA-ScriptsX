call AAA-Log %0 %*


:MAIN
	:: if "%1"=="" ( AAA-Obs %0 )

	cat %windir%\System32\drivers\etc\hosts | find.exe /V "#"
	exit /b


:OBS
>dhcp-
>net-
>ip-

	* view the host/DNS file
	
	dns-host-list


