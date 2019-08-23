Call AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1
	Setlocal

:MAIN
	
	AAA-Message ^
		"Store is:" ^
		"%kb-store%"  ^
		"" ^
		"Viewer is:" ^
		"%kb-viewer%"  ^
		"" ^
		"Last consult is:" ^
		"%kb-get%"


	if ERRORLEVEL 1 goto :CATCH0
	
	goto END
	

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

:

