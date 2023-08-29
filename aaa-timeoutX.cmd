
:: %1 is a string message to display in timeout window
:: if %1 is a number then timeout is redefined for current session
:: if %1 is ommited use a default message...

:MAIN
	@echo off
	:: hard-wired to avoid cyclic dependency
	:: and variable add/test error at :REDEFINE
	if NOT defined AAA-Timeout set AAA-Timeout=5

	:: if "%~1"==""   goto :MAINX
	if "%~1"==""   %0 "Waiting..."
	if "%~1"=="-?" ( AAA-Obs %0 )
	if "%~1"=="/?" ( AAA-Obs %0 )
	goto :MAINX


:MAINX

	start ^
		"Timeout %aaa-timeout%" ^
		cmd /c ^
		"color A0 & mode con lines=8 cols=32 & echo %* & timeout.exe %aaa-timeout%"

	goto :END


:REDEFINE
	:: DEAD***
	:: Dead-code,,, for observation only,,, 
	:: command was simplified removing the redefinition
	:: redefine the timeout (for the current console session)
	:: detecttion if %1 is a number should be done at :BEGIN
	set /a AAA-Timeout+=%1 
	echo AAA-Timeout is now %aaa-timeout%...
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs
>aaa-

	Syntax:
	
		AAA-Timeout <~Message>

		Display a Message in a Console Window 
		with the specified message 
		during AAA-Timeout seconds...
		
		if no AAA-Ecosystem is found 
		AAA-Timeout is hardwired to 5 seconds
