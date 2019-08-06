:ENTRY
	setlocal
	:: mode con lines=16 cols=80
	:: CALL aaa-log %0 %*
	

:INITIALIZE
	:: prompt ^> 


:BEGIN


:MAIN
	:: if "%~1%~2%~3%~4%~5%~6%~7%~8%~9"=="" goto :CATCH1
	
	Call aaa-log %0 %* 
	
	if "%~1"=="" aaa-main %~f0

	for %%f in (%*) do (
		if "%%~f"=="" (echo,) else (echo 	%%~f)
		)

	Call aaa-inshell
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	Call aaa-main "%~f0"
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	Call aaa-main "%~f0"
	Timeout 60
	goto END


:END
	echo,
	echo,


:FINALIZE

	
:EXIT
	exit /b
	endlocal


:OBS
aaa-message <message-to-display> ...

	Input a message to display
	with a timeout/countdown 
	or any key wait...
	
	use "" for a blank line... 
	
	???work??? if "" is first option will ommit banner
:
