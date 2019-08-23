:ENTRY
	CALL IBIT_Log %0 %1

	
:INITIALIZE

	
:BEGIN


:MAIN
	cd /d "C:\dat\#Scripts"
	for %%a in ( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ) do (
	echo [%%a]
	for %%b in (%%a*) do echo %%b
	echo.
	)
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

SCRIPTS-*
	Folder ____ Open folder 
	FolderX ___ Open folder extended


