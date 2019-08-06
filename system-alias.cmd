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
	if "%~1"=="" goto :CATCH0
	if "%~2"=="" goto :CATCH1
	
	:: 2do use %aaa-*% vasrs... %aaa-scripts% 
	set aaa-scripts=c:\dat\#scripts

	:: DO NOT OVERWRITE EXISTING ALIAS
	if exist %aaa-scripts%\%1.cmd goto :CATCH2

	call aaa-message "Will create:" "." "alias : %~1" "for" "macro : %~2" "at" "%aaa-scripts%"
	
	:: create alias file
	echo %2 %3 %4 %5 %6 %7 %8 %9 %%^*>%aaa-scripts%\%1.cmd
	
	echo %1.cmd ^> %2
	:: where %1.cmd
	:: type %aaa-scripts%\%1.cmd
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0:
	Call aaa-main "%~f0"
	goto :END


:CATCH1
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto :END

:CATCH2
	echo Alias "%~1" already exists...

	
:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	

:TEXT0

	System-Alias <name> <macro>

	* Alias "alias" is defined with aaa-alias
	* basic Alias only for now (no static parameters on alias)

	Examples:
	system-alias vars set %*
	system-alias varsx (cls & set %*)
	system-alias vncshot vncsnapshot.exe


:ERROR0

	An error has occured/0

: