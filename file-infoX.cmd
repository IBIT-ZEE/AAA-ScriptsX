Call AAA-Log %0 %*  


:MAIN
	if "%~1"=="" AAA-Obs %0
	if NOT exist %1 AAA-Message "File" "" "%~1" "" "not found..."

	fsutil file layout "%~1"
	exit /b


:OBS
	Syntax:

		File-infoX <file>
		
		Extensive information about the file
