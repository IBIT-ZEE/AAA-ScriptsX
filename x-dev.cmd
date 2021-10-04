:ENTRY
	CALL IBIT_LOG %*


:INITIALIZE
	
	
:BEGIN


:MAIN
	:: cd /d c:\%USERPROFILE%
	:: start "%cd%" cmd /k
	:: start "%cd%" explorer.exe %cd%
	start C:\APL\Microsoft\Code64\Code.exe %USERPROFILE%
	goto END


:ERR_SYNTAX

	
:END
	echo. 
	echo.


:FINALIZE


:EXIT



