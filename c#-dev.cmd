:ENTRY
	CALL IBIT_LOG %*


:INITIALIZE
	
	
:BEGIN


:MAIN
	:: cd /d c:\dat\c#
	:: start "%cd%" cmd /k
	:: start "%cd%" explorer.exe %cd%
	start C:\APL\Microsoft\Code64\Code.exe c:\dat\c# c:\dat\c#\x.csx
	start "C#-REPL" c#.lnk
	goto END


:ERR_SYNTAX

	
:END
	echo. 
	echo.


:FINALIZE


:EXIT



