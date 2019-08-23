:: Temporary Console
Call AAA-Log %0 %*

:MAIN
	setlocal
	if "%~1"=="" aaa-mainX %0

	mode con lines=8 cols=64 
	color 20

	%*

	set x=%errorlevel%
	goto :END


:END
	endlocal
	:: exit /b %x%
	exit %x%


:OBS
	AAA-Console <command> ...

		run command in a temporary console
	
		use START to launch in separate window
: