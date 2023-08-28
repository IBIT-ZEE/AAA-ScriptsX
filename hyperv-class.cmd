@call AAA-Log %0 %*


:MAIN
	:: ?no args -> display obs...
	:: ?no arg2 -> STATE as default arg & localhost as server
	:: ?no arg3 -> default server to localhost
	:: if "%~1"=="" ( AAA-Obs %0 )
	:: if "%~2"=="" ( %0 "%~1" STATE localhost )
	:: if "%~3"=="" ( %0 "%~1" "%~2" localhost )

	:: set xActions=
	:: set xActions=%xActions% CHECK CLEAN EXPLORE HOST LIST 
	:: set xActions=%xActions% ON OFF SSH STATE STATUS USER VM VNC XXX

	if "%1"=="" ( AAA-Obs %0 )
	if "%1"=="-?" ( AAA-Message "Actions:" "" "	%xActions%" )
	:: for %%f in ( %xActions% ) do ( if /i "%%f"=="%~1" goto :%~1 %* )
	goto :%~1 %*
	
	AAA-Message "Command not implemented :: %1"

	:: sucess goes quiet... error alert with :OBS
	:: goto :%2 %1 %3 || AAA-Timeout && AAA-Obs %0
	:: call :%2 %1 %3 || AAA-Timeout && AAA-Obs %0
	:: ATT*** call confuses params if called from outside
	
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

	:: show data
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
	call :_DEFINED hyperv-host
	echo HyperV- checking
	echo ============
	ping -n 3 -w 33 %hyperv-host%
	nmap %hyperv-host%
	exit /b


:CLEAN
	set hyperv-=
	set hyperv-host=
	set hyperv-user=
	
	call :STATE
	exit /b


:ENGINE-OFF
	call :_DEFINED hyperv-host
	echo Stopping engine...
	:: call powershell -c "stop-vm  -ComputerName '%~3' -Name '%1'"
	:: ssh %hyperv-user%@%hyperv-host% "sudo su -c 'shutdown 0'"
	net stop vmcompute
	exit /b


:ENGINE-ON
	echo Starting engine...
	:: call powershell -c "start-vm -ComputerName '%~3' -Name '%1'"
	net stop vmcompute
	exit /b


:EXPLORE
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-user
	
	::winscp root@%hyperv-host%
	winscp %hyperv-user%@%hyperv-host%
	
	exit /b


:GUI
	:: C:\Windows\System32\virtmgmt.msc
	:: @start /b "Hyper-V" C:\Windows\System32\virtmgmt.msc %*
	virtmgmt.msc
	exit /b


:HOST
	call :_PROPERTY hyperv-host %2
	exit /b


:LIST
	call :_DEFINED hyperv-host
	@powershell.cmd -c "get-vm -computername %hyperv-host%"
	exit /b


:SSH
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-user
	ssh %hyperv-user%@%hyperv-device% %*
	exit /b


:STATE
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-vm
	:: call :_DEFINED hyperv-user
	echo State of %hyperv-host%/%hyperv-vm%
	call powershell -c "get-vm -ComputerName '%hyperv-host%' -Name '%hyperv-vm%' | Format-List"
	goto :EOF


:STATUS
	echo Hyper-V status
	echo ==============
	echo,
	set hyperv-
	exit /b


:SHOW
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-vm
	echo Displaying %hyperv-host%/%hyperv-vm%
	start "%date% %time%" vmconnect.exe %hyperv-host% %hyperv-vm%
	exit /b


:OFF
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-vm
	echo Stopping %1...
	call powershell -c "stop-vm -ComputerName '%hyperv-host%' -Name '%hyperv-vm%'"
	::	ssh %hyperv-user%@%hyperv-host% "sudo su -c 'shutdown 0'"
	exit /b


:ON
	call :_DEFINED hyperv-host
	call :_DEFINED hyperv-vm
	echo [ Hyper-V/%hyperv-host%/%hyperv-vm% ] is starting..
	call powershell -c "start-vm -ComputerName '%hyperv-host%' -Name '%hyperv-vm%'"
	exit /b


:VM
	call :_PROPERTY hyperv-vm %2
	exit /b

	
:END
	echo,
	echo,
	exit /b


:OBS
>hyperv-
>me-vm-
>?host
>?host-vm
>vm-


	hyper-V class engine

		-? for help


	* Actions as methods
	* Properties as variables
	* for use in hyperv-* commands
	
