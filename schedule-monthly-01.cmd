::
call AAA-Log %0 %*

:MAIN
	setlocal
	aaa-main %~f0

	:: SCHEDULED
	
	endlocal
	exit /b

:OBS
	Schedule for:
	
	Weekly Friday at 22.22h


: