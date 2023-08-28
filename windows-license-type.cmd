call AAA-Log %0 %*


:MAIN
	if "%~1"=="-?" ( AAA-Obs %0 )
	
	slmgr.vbs /dlv
	
	exit /b


:OBS
>windows-license-
>windows-license-timeout

