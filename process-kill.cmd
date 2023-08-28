:: Get process IDs and kill them individually

:MAIN
	@echo off
	cls
	if "%~1"=="" AAA-Obs %0
	::if "%~1"=="" AAA-Message "Use :" ""  "Kill <imagename>"
	
	setlocal
	for /F %%f in ( '"wmic.exe process where (name like ^'%%%~1%%^' ) get processid"' ) do (
		call :KILL  %%f
		)

	endlocal
	exit /b

:: QUIRK***
:: sub-routine to overcome some DOS/Batch variables manipulation limitations
:: if manipulated in the main process
:KILL
	:: distill only numbers / drop strings and null
	set x=
	set /A x+=%1+0
	
	:: kill force and kill also child processes...
	if NOT "%x%"=="0" ( taskkill.exe /f /t /PID %* )
	exit /b


:OBS
>killX.cmd
>process-kill.cmd
>process-killX.cmd


	Syntax :
	
		Kill <imagename>
