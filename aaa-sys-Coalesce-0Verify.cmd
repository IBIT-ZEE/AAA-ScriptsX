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
	set x=


:BEGIN
	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#0::Verify-Previous" ^
		"Check for previous cohalescence..."
	
	if "%1"=="" goto :CATCH0
	if not "%1"=="-go" goto :CATCH0


:MAIN

	if exist C:\XXX ( call :CATCH1 C-SYS-FILES & goto :END )
	
	if exist K:\APL ( call :CATCH1 K-APL-FILES & goto :END )
	if exist K:\DAT ( call :CATCH1 K-DAT-FILES & goto :END )
	if exist K:\XXX ( call :CATCH1 K-XXX-FILES & goto :END )

	goto END



:CATCH0
	AAA-message ^
		"" ^
		"ATT!!!" ^
		"Level 0/Informal" ^
		"Use: -go to force start processing..."
	
	::DEAD-CODE
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	set aavErrorlevel=1
	
	:: QUIRK*** if invoke AAA-Message.cmd %»
	:: the parameters are not passed to the external script ???!!!
	:: must use Call/Exit
	Call AAA-Message ^
		"" ^
		"EXCEPTION:" ^
		"" ^
		"Some files already in place (%1)" ^
		"" ^
		"SAFE exit activated" ^
		"If APL/DAT/SYS/XXX dummies in place" ^
		"Please delete them and run again (AAA safeguard)" ^
		"stop Sandboxie/LANMessenger/TightVNC/7ZIP64(explorer)" ^
		"" ^
		"Please verify existence in K: of APL/DAT/SYS/XXX"
	
	::RETURN
	exit /b

	:: DEAD-CODE/FAILSAFE-ONLY
	goto END


:END
	echo. 
	echo.

:FINALIZE

	
:EXIT
	endlocal
	exit /b


