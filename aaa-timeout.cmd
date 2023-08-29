
:: %1 is a string message to display in timeout window
:: if %1 is a number then timeout is redefined for current session
:: if %1 is ommited use a default message...

:MAIN
	@echo off
	:: hard-wired to avoid cyclic dependency
	:: and variable add/test error at :REDEFINE
	if NOT defined AAA-Timeout "111 222 333" set AAA-Timeout=5

	:: if "%~1"==""   goto :MAINX
	if "%~1"==""   %0 Waiting...
	if "%~1"=="-?" ( AAA-Obs %0 )
	if "%~1"=="/?" ( AAA-Obs %0 )
	goto :MAINX


:MAINX

	:: color A0
	echo,
	echo,
	echo %* & 
	timeout.exe %aaa-timeout%"
	echo,
	echo,
	:: color
	exit /b 0

:Obs
>aaa-
>aaa-timeoutX

	Syntax:
	
		AAA-Timeout <~Message>

		Display a Message during <AAA-Timeout> seconds...

		if no AAA-Ecosystem is found 
		AAA-Timeout is hardwired to 5 seconds
