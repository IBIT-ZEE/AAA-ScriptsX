:ENTRY
	CALL IBIT_LOG %0 %1

	
:INITIALIZE

	
:BEGIN


:MAIN
	grep -Pzo "^:Syntax\K[\w\W]*" %~f0
	REM sed -n "/^\.Syntax\./,/^\.\./p" %~pnx0
	goto END


:ERR_SYNTAX
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT
	Exit /b




:Syntax

SCRIPTS-*
	Folder ____ Open folder 
	FolderX ___ Open folder extended
	Edit ______ (AAA) shell-open.exe c:\dat\#scripts
	EditX _____ (AAA) shell-open.exe c:\dat\#scriptsX


