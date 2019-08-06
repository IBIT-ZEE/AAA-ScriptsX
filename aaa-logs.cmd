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
	
	set xLogs=C:\XXX\!!!!LOGS

:BEGIN

:MAIN
	Call aaa-main "%~f0"
	
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	
	call edit %xLogs%\aaa-run.log
	call edit %xLogs%\aaa-error.log
	call edit %xLogs%\system-log.txt
	
	exit /b

	if ERRORLEVEL 1 goto :CATCH0
	goto END
	
:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END

:CATCH1
	goto :END

:END
	echo. 
	echo.

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