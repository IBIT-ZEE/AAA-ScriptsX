Call AAA-Log %0 %*


:MAIN
	setlocal
	set x=%USERPROFILE%\.ssh

	if "%~1"=="" goto :CATCH0
	if not exist %x%\authorized_keys~%1 goto :EX0

	copy /b %x%\authorized_keys~%1 %x%\authorized_keys
	
	echo %1 is now authorized...
	
	goto :END


:CATCH0
	Call AAA-Obs %0
	dir /s/b %x%
	goto :END


:END
	endlocal
	echo,
	echo,
	exit /b



:OBS
	Syntax:

		ssh-authorize <name>

		...


