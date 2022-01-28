

:MAIN
	@echo off
	if "%~1"==""  ( AAA-Obs %0 )
	if NOT defined AAA-Timeout set AAA-Timeout=5
	
	:: special case to redefine the timeout
	:: for the current console session
	if "%~1"=="-eq" ( 
		if "%~2"=="" ( 
			AAA-Obs %0 ) else ( 
			set AAA-Timeout=%2
			goto :END
			) 
		)
	
	setlocal
	:: CONVENIENCE
	:: if no %2, 
	:: detect if %1 
	::     is a number (for timmimg) -and- continue
	::     or a message to display   -and- recall with 0=default
	set x=0
	if "%~2"=="" ( 
		set /a x+=%1
		echo if errorlevel 1 %0 %AAA-Timeout% "%~1"
		)

	:: if "%~1"=="0" ( set x=%AAA-Timeout% ) else ( set x=%1 )
	:: set /a x+=0
	
	start ^
		"Timeout %x%" ^
		cmd /c ^
		"color A0 & mode con lines=8 cols=32 & echo %~2 & echo, & timeout.exe %x%"
	endlocal

:END
	echo,
	echo,
	endlocal
	exit /b


:Obs
	Syntax:
	
		AAA-Timeout <seconds> [Message]
		
		AAA-Timeout 0
		to use the default value from AAA-Timeout
		
		AAA-Timeout -eq <n>
		To redefine the default timeout
		(only for this console session)


