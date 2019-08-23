:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	
	:: default parameters assigment
	if "%~1"=="" ( set xDir=. )    else ( set xDir="%~1" )
	if "%~2"=="" ( set xFilter=* ) else ( set xFilter=%~2 )
	set xCount=0

	if not exist %xDir% goto :CATCH1

	for /R %xDir% %%f in ( "%xFilter%" ) do ( call :GO )
	
	echo %xCount%
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END


:GO
	:: calculation must be outside/for!expansion-variable-problem
	set /A xCount=%xCount%+1
	exit /b

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	Call aaa-main "%~f0"
	
	echo [ %xDir% ] not exist
	goto END

	
:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	
	Obs...


:TEXT0

	file-count [ <folder> [ <filter> ] ]



:ERROR0

	An error has occured/0

: