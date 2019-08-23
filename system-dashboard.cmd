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
	Call aaa-main "%~f0"

	:: WMIC /?
	:: wmic os get * /format:value
	WMIC bios get name
	WMIC CPU get name
	WMIC OS get name
	wmic os get bootdevice
	wmic os get lastbootuptime
	
	WMIC VOLUME get name, label
	
	echo.
	wmic /node:server0 cpu get name
	

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

	System-Dashboard

	Computer data
	AAA-* environment
	Scripts/X
	

:ERROR0

	An error has occured/0

: