

:MAIN
	@echo off
	if "%~1"=="" ( AAA-Obs %0 )

	if not exist "%~1" ( 
		AAA-Message "File not found..." "" "%~1" 
		)

	echo ~CLIPPED~ %~f1 
	echo %~f1 | clip
	
	exit /b


:Obs

	Syntax:

		File-Clip <file>

	Send the file-path to clipboard


