

:MAIN
	@if NOT "%~1"=="" Call aaa-log %0 %*
	
	:: sense dependencies
	where grep 1>nul 2>nul
	if errorlevel 1 AAA-MessageX "Dependencies missing:" "" "	grep"
	setlocal
	:: 1. sense %1 -as- ""
	:: 2. show banner if %1 -not- ""
	if "%~1"=="" if "%~2"=="" ( AAA-Obs %0 )
	for %%f in (%*) do ( echo,%%~f )
	goto END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS
	Syntax:

		aaa-message <message-to-display ...>

	Input a message to display
	use "" for a blank line... 
	"" as first option will ommit banner


