:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64

:BEGIN


:MAIN
	::if "%~1"=="" goto CATCH1
	::if "%~2"=="" goto CATCH1
	::if not exist "%~1" goto CATCH2
	::if not exist "%~2" goto CATCH2

	call ''' xcopy /e/d/r/i/l/c/Y "%~1" "%~2"
	:: /s=subs /d=date.newer /l=simulate 
	:: /c=error.continue /Y=prompt.autoconfirm
	:: this way we can compare folder with diverse parent paths
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END


:CATCH0
	:: catch no GREP or other command error
	AAA-Error %0 %*
	call aaa-inShell
	goto END

:CATCH1
	Call aaa-main "%~f0"
	:: help syntax/*comments/etc.
	:: grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	call aaa-inShell
	goto END

:CATCH2
	echo bad origin or destiny folder...
	echo,
	echo 	%1
	echo 	%2
	echo,
	echo,
	goto END

:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b
	endlocal


:OBS
	folders-compare <folder1> <folder2>

	Compare folders command 
	injected result in clipboard
	edit with default editor

	* Paste, parameterize and run

: