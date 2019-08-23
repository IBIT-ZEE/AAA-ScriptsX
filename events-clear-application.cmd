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
	set x=Application
	Call aaa-main %~f0
	
	:: gl=get-log
	wevtutil gl %x%
	echo,
	echo,

	:: qe=query-events rd=reverse-direction f=format c=count
	wevtutil qe %x% /rd:true /f:text /c:1
	echo,
	echo,
	
	:: cl=clear-log
	wevtutil cl %x%
	
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
	
	* Log header and last event listed before clearing


:TEXT0

	Aplication log... clearing events...


:ERROR0

	An error has occured/0

: