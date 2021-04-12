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

	echo 2DO*** registry work & RESTART

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



