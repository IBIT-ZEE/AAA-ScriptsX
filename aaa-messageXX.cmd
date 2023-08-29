

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
	::     is a number (for timming) -and- continue
	::     or a message to display   -and- recall with AAA-Timeout
	:: from here %1 -and- %2 are assured defined
	set x=0
	if "%~2"=="" ( 
		set /a x+=%1
		if errorlevel 1 %0 %AAA-Timeout% %1
		)
	
	:: echo 	[debug#1]	x=%x% & pause & exit /b

	:: clear errorlevel
	:: detect if %1 is NaN -or- recall with AAA-Timeout
	:: from here %1 -and- %2 are assured defined
	:: ATT*** ERRORLEVEL has quirk behaviour with SET
	call,
	set /a x+=%1
	if %x%==0 %0 %AAA-Timeout% %2
	:: echo  	[debug#2]	e#=%errorlevel%	x=%x%	xx=%xx% 	%%1=%1	%%2=%2 & pause & exit /b
	
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


