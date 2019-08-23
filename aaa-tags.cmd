:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1


:MAIN
	Call aaa-main "%~f0"
	echo,
	echo,
	
	cat c:\dat\$kb\aaa-tags.$kb | grep -i %*

	:: if ERRORLEVEL 1 goto :CATCH0
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


:FINALIZE
	

:EXIT
	endlocal
	exit /b


:OBS
	grab information stored in %aaaTags%

:
