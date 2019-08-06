:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64

:BEGIN


:MAIN
	aaa-main %~f0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	Timeout 60
	goto END

:CATCH2
	:: exception setting ERRORLEVEL 255-to-0
	grep -Poz "^:TEXT2\K[\w\W]*?(?=^:$)" %~f0
	:: return errorlevel1=file-not-in-path
	set aavErrorlevel=255
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b
	endlocal


:CATCH0
An error has occured


:TEXT0
	aaa-*
	
	<internal>
	aaa-log _____ Log time+program infornation / Splash header
	aaa-error ___ Log error on demand
	aaa-main ____ about caller (%0 %) show :TEXT0 and related scripts

:
