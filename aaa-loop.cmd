:: Loop a set of commands with a optional timeout...

call AAA-Log %0 %*

:MAIN
	if "%~1"=="" aaa-main %~f0


	for /L %%f in () do ( %* & %windir%\system32\Timeout.exe %aaa-Timeout% )

	exit /b


:OBS
	AAA-Loop <commands-to-loop>

		Loop a set of commands with a optional timeout

		uses %aaa-timeout% (default 5 seconds)
		
		use AAA-Vars to configure AAA Ecosystem
: