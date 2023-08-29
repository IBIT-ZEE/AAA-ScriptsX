call AAA-Log %0 %*


:MAIN
	setlocal
	if "%1"=="" ( AAA-Obs %0 )
	if NOT "%2"=="" ( AAA-Obs %0 )
	if exist "%aaa-scriptsX%\%~1.*" ( goto :ERR1 )
	set x=%1
	if NOT %x:~-1%==-  ( goto :ERR2 )
	
	echo Creating class %1...
	echo,
	echo,
	copy "%aaa-#%\aaa-.ps1" "%aaa-scriptsX%\%~1.*"
	:: copy "%aaa-scriptsX%\aaa-.ps1" "%aaa-scriptsX%\%~1.*"
	%x%

	endlocal
	goto :END


:ERR1
	AAA-Message "Class already exists"
	%1
	goto :END


:ERR2
	AAA-Message "Class name must end with '-'"
	%1
	goto :END


:END
	exit /b


:OBS
>aaa-

	* Create a new AAA class
	* terminating "-" to re-check intention


	Syntax:
	
		aaa-new <class>


	Samples:
	
		aaa-new google-
		aaa-new router-
		aaa-new www-
