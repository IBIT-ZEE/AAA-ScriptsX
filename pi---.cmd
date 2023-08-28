call AAA-Log %0 %*


:MAIN
	:: setlocal
	:: set xActions=CHECK CLEAN EXPLORE HOST ON OFF SSH STATE STATUS USER VNC XXX 
	if "%1"=="" ( AAA-Obs %0 )
	if "%1"=="-?" ( AAA-Message "Actions:" "" "	%xActions%" )
	:: for %%f in ( %xActions% ) do ( 	if /i "%%f"=="%~1" ( goto :%~1 %* ) )

	:: PARSER/DISPATCHER
	goto :%~1 %* 2>nul
	AAA-Message "Command not implemented :: %1"

	:: endlocal
	goto :END


:_PROPERTY
	:: %1 name  ( format must be <o>-<p> )
	:: %2 value ( if value is null and name exists just show current data )
	if "%2"=="" ( 
		if defined %1 ( 
			set %1 & exit /b 
			) else ( 
			AAA-Message "%1 is not defined..." 
			) 
		)

	:: DROPPED*** sleezy ground expanding variable name from parameter
	:: if defined %1 ( set %1-previous=%%1% )
	set %1=%2

	:: show pi-* data
	call :STATUS
	:: set pi-
	exit /b


:_DEFINED
	if not defined %1 ( 
		AAA-Message "%1 is not defined yet..."
		goto :END
		)

	exit /b


:CHECK
	call :_DEFINED pi-host
	echo PI- checking
	echo ============
	ping -n 3 -w 33 %pi-host%
	nmap %pi-host%
	exit /b


:CLEAN
	set pi-=
	set pi-host=
	set pi-user=
	
	call :STATE
	exit /b

:EXPLORE
	call :_DEFINED pi-host
	call :_DEFINED pi-user
	:: start "WinSCP/%pi-user%/%pi-host%" winscp %pi-user%@%pi-host%
	winscp %pi-user%@%pi-host%
	exit /b


:HOST
	call :_PROPERTY pi-host %2
	exit /b


:OFF
	call :_DEFINED pi-host
	call :_DEFINED pi-user
	ssh %pi-user%@%pi-host% "sudo su -c 'shutdown 0'"
	exit /b


:ON
	me-wol-pi
	exit /b


:RDC
	call :_DEFINED pi-host
	::call :_DEFINED pi-user
	mstsc.exe /v:%pi-host%
	exit /b


:SSH
	call :_DEFINED pi-host
	call :_DEFINED pi-user
	ssh %pi-user%@%pi-host%
	exit /b


:STATE
	echo PI- state
	echo =========
	echo,
	echo 2DO***
	exit /b


:STATUS
	echo PI- status
	echo ==========
	echo,
	set pi-
	exit /b


:USER
	call :_PROPERTY pi-user %2
	exit /b


:VNC
	call :_PROPERTY pi-host %2
	:: vnc %pi-host%
	C:\APL\!TOOLS\AAA\bin\tvnc64.exe %pi-host%
	exit /b


:XXX
	echo call %2 %3 %4 %5
	call %2 %3 %4 %5
	:: call :_PROPERTY pi-host
	exit /b


:END
	echo,
	echo,
	exit /b

:OBS
>pi-

	pi- class engine

		-? for help


	* Actions as methods
	* Properties as variables
	* for use in pi-* commands

	HOST   	USER
	
	ON      OFF     STATE   STATUS
	CHECK   CLEAN   EXPLORE
	RDP     SSH     VNC 
	XXX
