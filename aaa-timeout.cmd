
:MAIN
	@echo off
	if "%~1"=="/?"  ( AAA-Obs %0 )
	if NOT defined AAA-Timeout set AAA-Timeout=5
	
	if "%~1"=="-eq" ( 
		if "%~2"=="" ( 
			AAA-Obs %0 ) else ( 
			set AAA-Timeout=%2
			goto :END
			) 
		)
	
	setlocal
	if "%~1"==""   ( set x=%AAA-Timeout% ) else ( set x=%1 )
	set /a x+=0
	
	start "Timeout %x%" cmd /c "color A0 & mode con lines=8 cols=32 & timeout.exe %x%"
	endlocal

:END
	echo,
	echo,
	exit /b


:Obs
	Syntax:
	
		AAA-Timeout /?
		AAA-Timeout [<seconds>/<default>]
		
		defaults:
		if no arguments are supplied
		gets the value from AAA-Timeout
		
		AAA-Timeout -eq <n>
		To redefine the default timeout


