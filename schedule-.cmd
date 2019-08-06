::

setlocal
CALL AAA-Log %0 %*
::if "%~1"=="" goto CATCH1


:MAIN
	aaa-main %~f0

	endlocal
	exit /b


:OBS
	schedule-*

	scheduled tasks for
	. hourly ____ 0..23
	. daily _____ 0..23
	. weekly ____ n % 52
	. monthly ___ 1..12
	. other...
: