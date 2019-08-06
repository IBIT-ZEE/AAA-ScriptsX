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
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	Call aaa-main "%~f0"
	echo,
	echo,

	if "%~1"=="" goto :CATCH1
	if not exist "%~1" goto :CATCH1

	
	id3 -t "%f" "%1\*.mp3"

	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error
	Timeout 60
	goto :END


:CATCH1
	:: Call aaa-main "%~f0"
	Call aaa-message "" "Use:" "" "%~n0 <folder>"
	goto :END


:END
	echo,
	echo,


:FINALIZE
	

:EXIT
	endlocal
	exit /b


:OBS
	Traverse a folder and subfolders
	Set the mp3 tag title to the filename
: