::
call AAA-Log %0 %*

:MAIN
	setlocal
	aaa-main %~f0

	:: SCHEDULED
	aaa-messageX "it's 12.00h noon"
	
	endlocal
	exit /b

:OBS
	Schedule for:
	
	Daily at 12.00h

: