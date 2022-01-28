


:MAIN
	@echo off
	if "%~1"=="" AAA-Obs %0
	
	where.exe "%~1" >nul
	if ERRORLEVEL 1 AAA-Message "File:" "" "%1 not available..."

	exit /b


:OBS
	Syntax:
	
		File-Check <file>

	Check if file exists in current folder or %path%
	If not exists break script chain with error message


