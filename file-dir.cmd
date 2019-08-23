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
	if "%~1"=="" aaa-main "%~f0"
	if not exist "%~1" System-Message "file '%~1' not found"

	echo %~1
	echo %~f1
	echo %~f1 | clip
	echo Size is %~z1
	echo Date is %~t1
	echo Attr is %~a1
	echo DOSName: %~s1
	echo.
	echo "%~d1%~p1" | clip
	echo * folder fullname is in clipboard...

	start "" explorer %~d1%~p1

	:: exit here
	aaa-inShellX

	:: if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0

:TEXT0
	File container (Folder) information
	Automatically open container in explorer	

	Parameters 
		1. File

:ERROR0

	An error has occured/0

: