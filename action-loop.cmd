:: Loop a set of commands with a optional timeout...

call AAA-Log %0 %*

:MAIN
	if "%~1"=="" aaa-mainX %~n0

	for /L %%f in () do (%* & Timeout %aaaTimeout%)

	exit /b


:OBS
	Action-Loop <commands-to-loop>

		Loop a set of commands with a optional timeout

		uses %aaa-timeout% (default 5 seconds)

: