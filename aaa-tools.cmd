:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1


:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	Call aaa-main "%~f0"
	echo,
	echo,

	

	Call aaa-message "?cat"
	where xcat
	if %errorlevel%==1 goto :CATCH1
	Timeout 10

	Call aaa-message "?grep" 
	where grep
	if %errorlevel%==1 goto :CATCH1
	Timeout 10
	
	
	
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END
	

:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END


:CATCH1
	:: Call aaa-main "%~f0"
	:: Call aaa-message "Use:" "" "%~n0 <object>"
	AAA-Message ^
		"Tools are broken..." ^
		"?What CLI-Tool is missing ???"
	
	
	goto :END


:END
	echo,
	echo,


:FINALIZE
	

:EXIT
	endlocal
	exit /b


:OBS
	<command>-*

	Template for aaa-* scripts (language agnostic)

	*-method1 ___ short explain...
	*-method2 ___ short explain...
	...
:
