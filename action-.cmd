:ENTRY
	setlocal
	call AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1

:MAIN
	aaa-main %~nx0

	endlocal
	exit /b


:OBS
	Action-*

		Actions appliable to arguments

		*-Pause ___ Perform actions and wait for a Keypress
		*-Loop ____ Repeat forever with default timeout/interval
		*-Repeat __ Repeat xN times
		...

:
