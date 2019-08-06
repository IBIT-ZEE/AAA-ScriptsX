:ENTRY
	CALL AAA-Log %0 %*

:INITIALIZE
	
:BEGIN

:MAIN
	if "%~1"=="" goto :CATCH1
	
	shutdown -s -f -t %1
	
	if errorlevel 1 goto :CATCH0
	goto END

:CATCH0
	AAA-Error Internal error... %0 %*
	goto :END

:CATCH1
	grep -Pzo "^:Syntax\K[\w\W]*" %~f0
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

:EXIT
	Exit /b

:Syntax
	system-off <seconds>

	Will shutdown the computer
	counting down from <senconds>
	closing all applications (forced)



