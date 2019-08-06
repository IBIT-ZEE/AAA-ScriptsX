:ENTRY
	CALL IBIT_LOG %0 %*
	rem if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	cd /d C:\APL\PostGRES\bin
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	pg_ctl.exe -D c:\dat\postgres stop
	if ERRORLEVEL 1 TaskKill /F /IM postgres.exe
	if ERRORLEVEL 1 goto :CATCH1
	goto END

	
:CATCH1
	echo error was %errorlevel%...
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
PostGRE-Off

	Kill postgres.exe
	
	ATT***
	Use this only postgres not correctly finished
	The console that initiated server
	Should persist showing the log (via tails)
	and then stop the server...

: