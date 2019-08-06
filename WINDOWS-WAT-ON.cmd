:ENTRY
	CALL IBIT_LOG %0 %*

	
:INITIALIZE

	
:BEGIN
	

:MAIN
	echo ***2DO***
	Timeout 60
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

Windows activation on
ATT*** user must be Administrator

Restore activation detection 
in Windows 7 pre-SP1 was a update 971033
in Windows 7 pos-SP1 use takeown/icacls to restrict access to WAT


