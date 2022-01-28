

:MAIN
	@echo off
	if "%~1"=="" ( AAA-Obs %0 )

	start ^
		"AAA/Message" ^
		cmd /c ^
		@echo off ^& color A0 ^& mode con lines=8 cols=32 ^& ( for %%f in (%*) do echo,%%~f ) ^& echo, ^& pause^>nul
		
	endlocal
	:: "color A0 & mode con lines=8 cols=32 & echo %* & echo, & pause>nul"

:END
	echo,
	echo,
	endlocal
	exit /b


:Obs
	Syntax:
	
		AAA-Timeout <Message>
		
	* Display a non-modal dialog with the message and sound alert
	* visible until user close or press enter


