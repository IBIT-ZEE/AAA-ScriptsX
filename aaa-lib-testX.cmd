

call %*
exit /B


:F1
	echo F1
	echo %* 
	exit /b %errorlevel%


:F2
	echo F2
	echo %* 
	:: exit /b %errorlevel%


:F3
	echo F3
	echo %* 
	exit /b %errorlevel%
