

:MAIN
	@echo off
	setlocal

	if "%~1"=="" ( AAA-Obs %0 )

	set xFile=%1	
	if "%~2"=="" ( set xId=! ) else ( set xId=%2 )

	echo [ xId ^| xValue ^| xData ]
	echo ------------------------
	for /f "tokens=1,2*" %%a in ( %xFile% ) do (
		call :CONTAINS %%a %xId%

		if ERRORLEVEL 2 ( 
			echo ERROR 
			) else (  
				if ERRORLEVEL 1 (
					echo %%a	^|	%%b	^|	%%c
					)
			)
		)

	:: call :DEBUG %1 %2 %%a %%b %%c
	goto :END


:CONTAINS
	set x1=%1
	set x2=%2
	call set x=%%x1:%x2%=%%
	if %x1%==%x% ( exit /b 0 ) else ( exit /b 1 )
	exit /b 2

:DEBUG
	echo %%1	%1
	echo %%2	%2
	echo %%3	%3
	echo %%4	%4
	echo %%5	%5
	echo,
	echo xFile	%xFile%
	echo xId	%xId%
	echo x		%x%
	pause
	goto :END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS
	Syntax:
	
	data-get <file> <id>

	Works flat-file tables in %AAA-Data% folder

