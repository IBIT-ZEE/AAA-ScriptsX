:ENTRY
	CALL IBIT_LOG %*
	if "%1"=="" goto ERR_SYNTAX


:INITIALIZE


:BEGIN


:MAIN
	REM ?folder exists
	if not exist %1 goto ERR_PATHBAD
	
	REM ?already exists
	echo %path% | find /i "%1" >nul
	if %errorlevel%==0 goto ERR_PATHEXISTS
	
	set path=%path%;%1
	echo %path%
	goto END


:ERR_SYNTAX
	echo path-add ^<folder^>
	goto END

:ERR_PATHBAD
	echo %1 
	echo not exist!
	goto END

:ERR_PATHEXISTS
	echo %1
	echo is already in path...
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT



