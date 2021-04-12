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
		"Phase#3::Bootfix" ^
		"" ^
		"ATT^^^ ???"

	if "%1"=="" goto :CATCH0
	if not "%1"=="-go" goto :CATCH0


:MAIN

	:: #0
	echo,
	echo,
	Set /p x=[Phase#0::Clear-Boot-Stuff] Press 0 to continue... 
	if not "%x%"=="0" goto :EXIT


	:: ???not recommended if used as future VM
	Takeown /F       c:\boot
	Takeown /R /F    c:\bootmgr
	ICALCS  \boot    c:/grant administrators:F
	ICALCS  \bootmgr c:/grant administrators:F
	del     /f/s/q   c:\boot
	del     /f/s/q   c:\bootmgr
	rd      /s/q     c:\boot

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END



:CATCH0
	AAA-message ^
		"" ^
		"ATT!!!" ^
		"Level 3/Dangerous" ^
		"Use: -go to force start processing..."

	::DEAD-CODE
	goto END

	
:EXIT
	grep -Poz "^:ERROR2\K[\w\W]*?(?=^:)" %~f0
	Timeout 60

	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b

