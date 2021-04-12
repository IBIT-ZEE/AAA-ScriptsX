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
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END

	
:END
	echo,
	echo,

:FINALIZE
	
:EXIT
	endlocal
	exit /b

:OBS
	ATT*** EXECUTE THIS FROM NT AUTHORITY\SYSTEM
	
	cd /d %windir%\System32\winevt\Logs
	psexec -s cmd
	
	net stop "task scheduler"
	net stop eventlog
	
	md _bak
	move /Y . bak

	net start task scheduler
	net start eventlog
: