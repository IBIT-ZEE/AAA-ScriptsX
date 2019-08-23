:ENTRY
	CALL IBIT_LOG %0 %1

	
:INITIALIZE

	
:BEGIN


:MAIN
	shutdown -l
	goto END


:ERR_SYNTAX
	grep -Pzo "^:Syntax\K[\w\W]*" %~f0
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT
	Exit /b




:Syntax

PC-Logoff

Will close current session



