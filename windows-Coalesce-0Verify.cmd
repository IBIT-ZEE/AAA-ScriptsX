call IBIT_LOG %0 %*


:MAIN
	setlocal

	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#0::Verify-Previous" ^
		"Check for previous cohalescence..."
	
	if "%1"==""           AAA-Obs %0
	if /i not "%1"=="-go" AAA-Obs %0

	::
	set x=
	if exist C:\XXX ( call :CATCH1 C-SYS-FILES & goto :END )

	if exist K:\APL ( call :CATCH1 K-APL-FILES & goto :END )
	if exist K:\DAT ( call :CATCH1 K-DAT-FILES & goto :END )
	if exist K:\XXX ( call :CATCH1 K-XXX-FILES & goto :END )

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
		"	Some files already in place (%1)" ^
		"" ^
		"SAFE exit activated" ^
		"If APL/DAT/SYS/XXX dummies in place" ^
		"Please delete them and run again (AAA safeguard)" ^
		"stop Sandboxie/LANMessenger/TightVNC/7ZIP64(explorer)/..." ^
		"" ^
		"Verify existence in K: of APL/DAT/SYS/XXX"
	
	::RETURN
	exit /b

	:: DEAD-CODE/FAILSAFE-ONLY
	goto END


:END
	echo. 
	echo.
	endlocal
	exit /b


:OBS
	AAA-System-Coalescer
		Phase#0::Verify-Previous
		Check for previous cohalescence...

		ATT***
		Level 0/Informal
		
		Use: -go to force start processing...
	

