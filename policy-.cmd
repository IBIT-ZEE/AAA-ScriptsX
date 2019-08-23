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
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
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
	:: exception setting ERRORLEVEL
	grep -Poz "^:TEXT2\K[\w\W]*?(?=^:$)" %~f0
	:: return errorlevel1=file-not-in-path
	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b



:TEXT0

An error has occured

:TEXT1

	<command>-*

		Template for aaa-* scripts (language agnostic)

		*-method1 ___ short explain...
		*-method2 ___ short explain...
		...
		
echo 1 = Policy 
echo 2 = Group Policy Editor (gpedit.msc)
echo 3 = Domain Policy (dompol.msc)
echo 4 = Resultant Set of Policy (rsop.msc)



:
