call AAA-Log %0 %*

:MAIN
	if "%aaa-timeout%"=="" set aaa-timeout=5

	For /L %f in (1 1 %1) do (%2 %3 %4 %5 %6 %7 %8 %9 & Timeout %aaa-timeout%)

	exit /b


:OBS
	AAA-Repeat <n-times> <commands-to-repeat>

		Repeat commands <N> times with a optional timeout

		uses %aaa-timeout% (default 5 seconds)

		use AAA-Vars to configure AAA Ecosystem
: