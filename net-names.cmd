
:MAIN
	setlocal
	CALL aaa-log %0 %*

	hostname
	echo %username%
	:: net statistics server |find "since"
	net statistics workstation |findstr "since"
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END


:END
	echo. 
	echo.
	endlocal
	exit /b


:OBS
	
	???
