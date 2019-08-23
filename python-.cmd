:ENTRY
	CALL IBIT_LOG %0 %*

	
:INITIALIZE


:BEGIN


:MAIN
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	if ERRORLEVEL 1 goto :CATCH1
	goto END

	
:CATCH1
	echo.
	echo.
	echo ERRORLEVEL ___ %errorlevel%
	echo FOLDER _______ %cd%
	echo.
	echo Probably 'GREP' not found...
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
Python-*

	*-2 _____ Last version o Python 2 console
	*-3 _____ Last version o Python 3 console
	*-IDE ___ IDE CLI+EXP+COD (python3 based)
	

: