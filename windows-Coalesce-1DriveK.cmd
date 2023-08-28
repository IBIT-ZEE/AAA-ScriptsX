call IBIT_LOG %0 %*


:MAIN
	setlocal

	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#1::Reassign D: to K:" ^
		"ATT^^^main drive must be D:"

	if "%1"=="" goto :CATCH0
	if not "%1"=="-go" goto :CATCH0

	::
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


:END
	set aavErrorlevel=1
	echo. 
	echo.
	endlocal
	exit /b



