
:ENTRY
	CALL IBIT_LOG
	if "%1"=="" goto ERR_SYNTAX

:INITIALIZE
	set aaoHost=%1
	if "%2"=="+" set aaoServices=/SVC

:BEGIN
	ping -n 1 %aaoHost%
	if ERRORLEVEL==1 goto ERR_HOST
	set aaoHost=\\%aaoHost%
	psexec %aaoHost% /u oem /p ooeemm "Tasklist %2"
	if ERRORLEVEL==1 Pause
	goto END

:ERR_SYNTAX
	echo Objective -^> List processes
	echo Syntax    -^> Tasks ^<host^> +
	goto END

:ERR_HOST
	echo Host not exist or not available
	goto END

:END
	echo. 
	echo.

:FINALIZE
	set aaoProcess=
	set aaoHost=

:EXIT



