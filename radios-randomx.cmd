:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE


:BEGIN


:MAIN
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test and
	:: move to :CATCH1 if using parameters
	:: Call aaa-main "%~f0"
	
	:: BEGIN ~ PUT HERE URL SELECTION ALGORYTH
	set xRadios="http://tsfdirecto.tsf.pt/tsfdirecto.mp3"
	::set xRadios="http://centova.radios.pt:9558/;listen.pls"
	:: END
	
	start "%date%~%time%" "%ProgramFiles(x86)%\Windows Media Player\wmplayer.exe" %xRadios%
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto :END


:CATCH1
	goto :END


:END
	echo. 
	echo.
	exit /b


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS


: