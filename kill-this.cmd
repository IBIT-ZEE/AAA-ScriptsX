:ENTRY
	CALL IBIT_LOG
	if "%1"=="" goto ERR_SYNTAX

:INITIALIZE
	REM set aavProcess=%1

:BEGIN
	Taskkill /IM %1
	:: TaskKill /f /fi "imagename eq %1*"
	if ERRORLEVEL==1 Pause
	goto END

:ERR_SYNTAX
	echo Kill a process
	echo.
	echo Syntax -^> Kill ^<executable^> [^<host^>]
	goto END

:END
	echo. 
	echo.

:FINALIZE
	REM set aavProcess=

:EXIT



