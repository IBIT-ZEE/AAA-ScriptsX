:ENTRY
	CALL IBIT_LOG %0 %*

	
:INITIALIZE
	set aavTemp=c:\dat\python

:BEGIN


:MAIN
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	cd %aavTemp%
	:: start cmd /k
	start python-3
	:: start explorer.exe %aavTemp%
	start code.lnk %aavTemp%
	if ERRORLEVEL 1 goto :CATCH1
	goto END


:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo.
	echo.
	echo ERRORLEVEL ___ %errorlevel%
	echo FOLDER _______ %cd%
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

	???
	!!!

: