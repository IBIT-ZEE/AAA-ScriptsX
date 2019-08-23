:ENTRY
	CALL IBIT_LOG %0 %*
	if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	echo %*
	pause
	if ERRORLEVEL 1 goto :CATCH2
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo.
	echo.
	echo ERRORLEVEL : %errorlevel%
	echo FOLDER     : %cd%
	grep -Poz "^:TEXT2\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
SYNTAX

	cmd-*
	
	cmd-debugger ___ execute a script step-by-step
	cmd-params _____ show all params ?debug aspas/plicas
	cmd-paramsx ____ special parameter expansion debug %~<X>
	cmd-env ________ env vars work variants


:TEXT2
CATCH#

	ERRORLEVEL was > 0

: