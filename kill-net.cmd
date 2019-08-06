
:ENTRY
	CALL IBIT_LOG
	if "%1"=="" goto ERR_SYNTAX

:INITIALIZE
	set aavProcess=%1
	if NOT "%2"=="" set aavHost=\\%2

:BEGIN
	ping -n 1 %aaoHost%
	if ERRORLEVEL==1 goto ERR_HOST
	psexec %aavHost% /u oem /p ooeemm "TaskKill /f /fi "imagename eq %1""
	if ERRORLEVEL==1 Pause
	goto END

:ERR_SYNTAX
	echo Kill a process in a remote host
	echo.
	echo Syntax -^> Kill ^<executable^> [^<host^>]
	goto END

:ERR_HOST
	echo Host not exist or not available
	goto END

:END
	echo. 
	echo.

:FINALIZE
	set aavProcess=
	set aavHost=

:EXIT



