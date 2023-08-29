
:MAIN
	@echo off
	:: setlocal
	
	:: REFACTOR***
	if "%~1%~2%~3%~4%~5%~6%~7%~8%~9"=="" ( AAA-Obs %0 )
	
	if "%aaa-options-banner%"=="1" (call AAA-Logo %* )
	for %%f in ( %* ) do ( echo,%%~f )
	if "%aaa-options-pause%"=="1" ( pause >nul )
	:: endlocal
	exit /b


:OBS
>aaa-
>aaa-log
>aaa-obs
>aaa-vars

	Syntax:

		aaa-message <message-to-display ...>

	Input a message to display
	use "" for a blank line... 
	use aaa-option-banner to display banner
	use aaa-option-pause  to pause after message


// SAMPLES
aaa-message 1 22 333
aaa-option-banner 0
aaa-message 1 22 333 4444
aaa-option-pause 1
aaa-message 1 "" 22 333 "" "4444 55555 666666"



