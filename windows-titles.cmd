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
	:: enable parameter test and
	:: move to :CATCH1 if using parameters
	TASKLIST /v /fo list |find /i "window title" |find /v "Window Title: N/A"

	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
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


:OBS0
	
	Obs...


:TEXT0

	<command>-*

	Template for aaa-* scripts (language agnostic)

	*-method1 ___ short explain...
	*-method2 ___ short explain...
	...


:ERROR0

	An error has occured/0

: