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
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	
	echo,
	echo 	Files:
	echo 	======
	for %%f in ( %~dpn0*.* ) do echo 	%%~nf
	
	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:)" %~f0
	Timeout 60
	goto END



:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:TEXT0

	MACRO-*

		Macro functionality 
		(F2KO-macrocmd32/64, ...)

		*-record ___ Record a macro
		*-play _____ Play a macro
		...

:ERROR0

	An error has occured

:
