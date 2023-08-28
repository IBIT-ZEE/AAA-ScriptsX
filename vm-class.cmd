call AAA-Log %0 %*


:MAIN
	:: PARSER/DISPATCHER
	if "%1"=="" ( call AAA-Obs %0 & set vm- & exit /b )

	goto :%~1 %* 2>nul || (
		echo on
		AAA-Message "	Command not implemented :: %1" 
		)

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
	exit /b
	

:_DEFINED
	if not defined %1 ( 
		AAA-Message "%1 is not defined yet..."
		goto :END
		)

	exit /b


:CHECK
	call :_DEFINED vm-ip
	echo VM- check
	echo =========
	:: ping -n 3 -w 33 %wsl-ip%
	:: nmap %wsl-ip%
	exit /b


:CLEAN
	set vm-=
	set vm-engine=
	set vm-host=
	set vm-name=

	call :STATUS
	exit /b



:DEFAULT
	echo 	Setting default values for -engine -host and -vm
	echo,
	echo,
	
	:: call :_PROPERTY vm-engine hyperv-
	:: call :_PROPERTY vm-host   localhost
	:: call :_PROPERTY vm-name   x
	
	set vm-engine=hyperv
	set vm-host=localhost
	set vm-name=x
	
	set vm-ip=localhost
	set vm-user=oem

	call :STATUS
	
	exit /b


:ENGINE
	call :_PROPERTY vm-engine %2
	exit /b


:ECOSYSTEM
	call :_DEFINED vm-engine
	call :_DEFINED vm-host
	call :_DEFINED vm-name
	exit /b


:ECOSYSTEMX
	call :_DEFINED vm-ip
	exit /b


:EXPLORE
	call :_DEFINED vm-ip
	call :_DEFINED vm-user
	start "%vm-user%@%vm-ip%" winscp %vm-user%@%vm-ip%
	exit /b


:GUI
	call :_DEFINED vm-engine
	%vm-engine%-GUI
	exit /b
	

:HOST
	call :_PROPERTY vm-host %2
	exit /b


:IP
	call :_PROPERTY vm-ip %2
	exit /b


:LIST
	call :_DEFINED vm-engine
	call :_DEFINED vm-host
	:: %vm-engine%-class HOST
	call %vm-engine%-HOST %vm-host%
	echo,
	echo Running now...
	:: %vm-engine%-class LIST
	call %vm-engine%-LIST
	goto :END


:NAME
	call :_PROPERTY vm-name %2
	exit /b


:OFF
	call :_DEFINED vm-engine
	call :_DEFINED vm-host
	call :_DEFINED vm-name
	call %vm-engine%-HOST %vm-host%
	call %vm-engine%-VM   %vm-name%
	call %vm-engine%-OFF
	goto :END


:ON
	:: %vm-engine%-class HOST
	:: %vm-engine%-class HOST
	:: %vm-engine%-class LIST
	call :_DEFINED vm-engine
	call :_DEFINED vm-host
	call :_DEFINED vm-name
	call %vm-engine%-HOST %vm-host%
	call %vm-engine%-VM   %vm-name%
	call aaa-messageX %vm-engine% %vm-host% %vm-name% %vm-user% %vm-ip% 
	call %vm-engine%-ON
	goto :END


:RDC
	call :_DEFINED vm-ip
	mstsc.exe /v:%vm-ip%
	exit /b


:SHOW
	call :_DEFINED vm-engine
	call :_DEFINED vm-host
	call :_DEFINED vm-name
	:: call :_DEFINED vm-user

	::%vm-engine%-class HOST %vm-host%
	::%vm-engine%-class VM   %vm-name%
	::%vm-engine%-class SHOW
	call %vm-engine%-SHOW %vm-name%
	exit /b


:SSH
	call :_DEFINED vm-ip
	call :_DEFINED vm-user
	echo 	SSH -to- %vm-ip% -as- %vm-user%...
	echo,
	echo,
	ssh %vm-user%@%vm-ip%
	exit /b


:STATE
	echo VM- state
	echo ==========
	echo 2DO***
	echo,
	goto :END


:STATUS
	echo VM- status
	echo ==========
	set vm-
	echo,
	exit /b



:TOUCH
	echo 	Transfer properties data to selected engine...
	echo,

	set %vm-engine%-host=%vm-host%
	set %vm-engine%-vm=%vm-name%

	call :STATUS
	exit /b


:USER
	call :_PROPERTY vm-user %2
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
>vm-
>hyperv-
>qemu-
>virtualbox-
>wsl-

	vm-class

	engine for agnostic virtual-machine control


	PROPERTIES
	==========	
		engine ... engine to use (hyperv- qemu- virtualbox- ...)
		host ..... host name or ip
		name ..... name of the vm

	ACTIONS
	=======
		DEFAULTS ... 
		ON      OFF     STATE   STATUS  CHECK   CLEAN
		EXPLORE EXPLOREX
		RDP     SSH     VNC
		XXX
