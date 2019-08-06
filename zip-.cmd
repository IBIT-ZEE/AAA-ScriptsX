:ENTRY
	CALL IBIT_LOG
	if "%1"=="" goto ERR_SYNTAX

	
:INITIALIZE
	

:BEGIN


:MAIN
	C:\APL\!TOOLS\__xxx\7ZIP\7z.exe %*
	goto END

:ERR_SYNTAX
	cd C:\APL\!TOOLS\__xxx\7ZIP
	7z.exe -?
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT



