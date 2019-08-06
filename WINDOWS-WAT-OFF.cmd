:ENTRY
	CALL IBIT_LOG %0 %*

	
:INITIALIZE

	
:BEGIN
	

:MAIN
	echo Restricting System access to WAT
	echo.
	echo.
	cd %windir%\System32
	takeown /f slui.exe
	takeown /f slwga.dll
	icacls slui.exe /deny *S-1-1-0:(X)
	icacls slwga.dll /grant *S-1-1-0:F
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

Windows activation off 
ATT*** user must be Administrator

Remove activation detection 
in Windows 7 pre-SP1 was a update 971033
in Windows 7 pos-SP1 use takeown/icacls to restrict access to WAT


