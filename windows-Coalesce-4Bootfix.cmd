call IBIT_LOG %0 %*


:MAIN
	setlocal

	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#4::Bootfix" ^
		"" ^
		"ATT^^^ ???"

	if "%~1"==""       AAA-Obs %0
	if /i not "%1"=="-go" AAA-Obs %0

	echo,
	echo,
	Set /p x=[Phase#0::Clear-Boot-Stuff] Press 0 to continue... 
	if not "%x%"=="0" goto :EXIT

	Takeown /F       c:\boot
	Takeown /R /F    c:\bootmgr
	ICALCS  \boot    c:/grant administrators:F
	ICALCS  \bootmgr c:/grant administrators:F
	
	:: ???not recommended if used as future VM
	del     /f/s/q   c:\boot
	del     /f/s/q   c:\bootmgr
	rd      /s/q     c:\boot

	
:END
	echo. 
	echo.
	endlocal
	exit /b


:OBS
	AAA-System-Coalescer
	
		Phase#4::Bootfix

		ATT***
		Level 3/Dangerous
		
		Use: -go to start processing...

