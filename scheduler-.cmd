:: AAA eXternal simplification for log operation and show available descendants 
:: >:OBS

:BEGIN
	setlocal
	Call aaa-log %~0 %*	

:MAIN
	:: if no parameter
	:: then recurse for me/itself
	if "%~1"=="" aaa-mainX.cmd %~n0
	
	set x=c:\dat\#scriptsX\%1.cmd
	if exist %x% call aaa-main %x%
	

:END
	echo,
	echo,
	
	endlocal
	exit /b


:OBS
	Time related actions programming
	
	see also:
		Schedule-*
		Task-*
		Tasks-*
	
:
	


