Call AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1
	Setlocal

:MAIN
	if NOT "%~1"=="" goto :MAINX
	
	aaa-main %~f0
	::grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	:: <COMMANDS>

	if ERRORLEVEL 1 goto :CATCH0
	
	goto END

:MAINX
	:: ATT*** hardwired $kb path
	set xPath=C:\DAT
	
	echo in $KB ...
	dir /b/s %xPath%\$kb\*%1*
	echo,
	echo,
	
	echo in $KBX ...
	dir /b/s %xPath%\$kbx\*%1*
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	Timeout 60
	goto END

:END
	echo, 
	echo,

	endlocal
	exit /b



:OBS

	KB-Find <?>

		Find the Knowledgebase elements title 
		for supplied element (*?*)

		...
:
