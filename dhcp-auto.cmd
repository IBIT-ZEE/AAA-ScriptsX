:ENTRY
	setlocal
	CALL AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1
	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64

:BEGIN

:MAIN
	' ~ netsh interface ip set address name="LAN1" source=dhcp
	if ERRORLEVEL 1 goto :CATCH0
	goto END

:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END

:END
	echo. 
	echo.

:FINALIZE
	
:EXIT
	exit /b
	endlocal

:TEXT0

	An error has occured
:
