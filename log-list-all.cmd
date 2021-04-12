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
	Call aaa-main %~f0
	
	for /F %%f in ( 'wevtutil el' ) do (
		echo Log: %%f
		:: wevtutil qe /rd:true /f:text /c:1 %%f
		wevtutil qe /rd:true /f:text %%f
		echo,
		echo,
		REM if not errorlevel 1 Timeout 10
		)

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
	
	Obs...


:TEXT0

	Events-List-All -> List all events in the event log...


:ERROR0

	An error has occured/0

: