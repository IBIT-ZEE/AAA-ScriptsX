call AAA-Log %0 %*


:MAIN
	:: if "%1"=="" ( AAA-Obs %0 )

	edit %windir%\System32\drivers\etc\hosts
	exit /b


:OBS
>dhcp-
>net-
>ip-

	* Edit the Windows hosts file...

	dns-host-edit
	


