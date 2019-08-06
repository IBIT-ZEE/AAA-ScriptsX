:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	mode con: lines=10 cols=80
	color AF

	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1


:MAIN
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	if "%~1"=="" aaa-main "%~f0"

	:: ATT*** 
	:: ?current folder has this files
	:: ?or has full info path to change folder
	if ERRORLEVEL 1 goto :CATCH0

	set x=
	
	:MAIN1
	if "%~1"=="" goto :MAIN2
		echo %~t1	%~z1	%~f1
		set x=%x%%~f1 
		shift
	goto :MAIN1

	:MAIN2	
	echo %x% | CLIP

	
	call aaa-inShell
	if errorlevel 1 Timeout 60

	goto END
	

:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END


:CATCH1
	:: Call aaa-main "%~f0"
	:: Call aaa-message "Use:" "" "%~n0 <object>"
	goto :END


:END
	echo,
	echo,
	

:EXIT
	endlocal
	exit /b


:OBS
	files-info

	Information about files passed as parameter
	
	if file(s) are not in the current folder
	then the file full name is required...

:
