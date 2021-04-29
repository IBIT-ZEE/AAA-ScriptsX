:ENTRY
	setlocal
	:: mode con lines=16 cols=80
	:: CALL aaa-log %0 %*
	

:INITIALIZE
	:: prompt ^> 


:BEGIN


:MAIN
	
	:: PERMIT %1 AS ""
	if "%~1"=="" if "%~2"=="" (
		:: CANT USE SELF/AAA-MESSAGE
		Call aaa-log %0 %*
		grep -Poz "\n:OBS\K[\w\W]*?(?=\n:)" %~f0
		goto :END
		)
	
	if NOT "%~1"=="" Call aaa-log %0 %*

	for %%f in (%*) do (
		if "%%~f"=="" (echo,) else (echo 	%%~f)
		)

	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	Call aaa-main "%~f0"
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
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
	
	"" as first option will ommit banner

:
