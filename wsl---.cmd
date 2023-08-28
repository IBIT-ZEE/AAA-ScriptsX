call AAA-Log %0 %*


:MAIN
	:: PARSER/DISPATCHER
	if "%1"=="" ( AAA-Obs %0 )

	goto :%~1 %* 2>nul
	AAA-Message "Command not implemented :: %1"

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
	set %1=%2

	call :STATUS
	exit /b


:_DEFINED
	if not defined %1 ( 
		AAA-Message "%1 is not defined yet..."
		goto :END
		)

	exit /b


:CHECK
	call :_DEFINED wsl-ip
	echo WSL- checking
	echo ============
	ping -n 3 -w 33 %wsl-ip%
	nmap %wsl-ip%
	exit /b


:CLEAN
	set wsl-=
	set wsl-host=
	set wsl-ip=
	set wsl-user=
	
	call :STATE
	exit /b


:EXPLORE
	call :_DEFINED wsl-ip
	:: call :_DEFINED pi-user
	:: start "WinSCP/%pi-user%/%pi-host%" winscp %pi-user%@%pi-host%
	winscp root@%pi-host%
	exit /b


:IP
	:: call :_PROPERTY wsl-ip %2
	netsh interface ip show config "vEthernet (WSL)"
	exit /b


:LIST
	wsl.exe --list --all --verbose
	echo,
	echo Running now...
	wsl.exe --list --running
	goto :END


:OFF
	:: call :_DEFINED wsl-ip
	:: call :_DEFINED wsl-user
	:: ssh root@%wsl-ip% "sudo su -c 'shutdown 0'"
	wsl.exe --shutdown
	wsl.exe --list --running
	wsl.exe --list --all --verbose
	goto :END


:ON
	echo "WSL.exe will autostart LxssManager Service"
	echo,
	wsl.exe
	goto :END


:RDC
	call :_DEFINED pi-host
	::call :_DEFINED pi-user
	mstsc.exe /v:%wsl-ip%
	exit /b


:SSH
	call :_DEFINED pi-host
	call :_DEFINED pi-user
	ssh %wsl-user%@%wsl-ip%
	exit /b


:STATE
	echo WSL- state
	echo ==========
	echo,
	wsl.exe --status
	goto :END


:STATUS
	echo WSL- status
	echo ==========
	set wsl-
	echo,
	echo %USERPROFILE%\.wslconfig
	more /s %USERPROFILE%\.wslconfig
	exit /b


:VNC
	call :_PROPERTY wsl-ip %2
	:: vnc %wsl-ip%
	C:\APL\!TOOLS\AAA\bin\tvnc64.exe %wsl-ip%
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
>wsl-

	wsl- engine/class

		-? for help


	* Actions as methods
	* Properties as variables
	* for use in pi-* commands

	IP
	
	ON      OFF     STATE   STATUS  CHECK   CLEAN
	EXPLORE EXPLOREX
	RDP     SSH     VNC
	XXX
