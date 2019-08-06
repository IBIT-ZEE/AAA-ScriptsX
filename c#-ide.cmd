:ENTRY
	CALL IBIT_LOG %*


:INITIALIZE
	
	
:BEGIN


:MAIN
	cd \dat\c#
	start "%cd%" C:\APL\!TOOLS\_applets\SublimeText\sublime_text.exe c:\dat\c#
	start "%cd%" cmd /k
	start "%cd%" explorer.exe %cd%
	goto END


:ERR_SYNTAX

	
:END
	echo. 
	echo.


:FINALIZE


:EXIT



