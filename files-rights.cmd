:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	Call aaa-main "%~f0"
	
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0


:TEXT0
	takeown /A /R /F .
	icacls . /grant Administrators:F /T

	use also Files-RightsX to launch GUI(s)


:ERROR0

	An error has occured/0

: