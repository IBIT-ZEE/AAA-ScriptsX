Call AAA-Log %0 %*
	:: if "%~1"=="" goto CATCH1
	Setlocal

:MAIN
	:: if parameter %1 not present then set defaults
	if "%~1"==""                   AAA-Main %~0
	
	:: TURN-ON GLOBALS
	Endlocal
	set x=C:\DAT\$KB\%1.$kb
	if "%x%"=="" goto :MAINX
	
	set kb-store=%x%
	
	:: TURN-OFF GLOBALS
	SetLocal
	
	KB-State
	goto END


:MAINX
	AAA-Message "$kb %1 não existe..."

	goto :END


:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo, 
	echo,

	endlocal
	exit /b


:OBS

	KB-Store <store>

		set %kb-store%
		for current *.$kb operations

:

