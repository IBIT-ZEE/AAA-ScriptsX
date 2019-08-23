::
call AAA-Log %0 %*

:MAIN
	title %~n0
	setlocal
	call aaa-main %~f0

	:: SCHEDULED
	call Radios-Random
	
	endlocal
	exit /b

:OBS
	Schedule for:
	
	Daily at 12.00h

: