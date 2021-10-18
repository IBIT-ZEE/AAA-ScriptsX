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
	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#1::Reassign D: to K:" ^
		"ATT^^^main drive must be D:"

	if "%1"=="" goto :CATCH0
	if not "%1"=="-go" goto :CATCH0


:MAIN

	registry-go HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices

	choice /m "Press:  |>  0=Reboot...  |  1=Exit!  <|  " /c 01 /d 1 /t 60
	
	:: if choice was not "0-key" then LOCK
	if not %errorlevel%==1 ( 
		shutdown.exe -r -f -t 0
		goto :END
		)

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	

:CATCH0
	AAA-message ^
		"" ^
		"ATT!!!" ^
		"Level 2/Alert" ^
		"Use: -go to force start processing..."

	::DEAD-CODE
	goto END



:EXIT
	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b



