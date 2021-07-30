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
	Call aaa-main "%~f0"

	echo,
	echo,
	echo 	ATT***
	echo,
	echo 	for hardcore work...
	echo 	do it as SYSTEM...
	echo,
	echo,
	echo 1. icacls "%~1" /T /C /setowner Administrators 
	echo 2. icacls "%~1" /T /C /reset
	echo 3. icacls "%~1" /T /C /inheritance:r
	echo 4. icacls "%~1" /T /C /grant:r Administrators:F

	if ERRORLEVEL 1 goto :CATCH0
	goto :END

	
:CATCH0
	:: catch no GREP or other command error
	AAA-Error %0 %*
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS
	* Use the provided sequence...
	* Call this again with a path to insert in sequence...

: