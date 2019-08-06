:ENTRY
	CALL IBIT_LOG
	::if "%1"=="" goto ERR0


:INITIALIZE


:BEGIN
	:: grep -Poz "^:MENU1\K[\w\W]*?(?=:)" %~f0

:MAIN
	start "%cd%" nodeX.lnk
	start "%cd%" testNode!!!.lnk
	start "%cd%" c:\dat\webdev\_testNode
	start "%cd%" code c:\dat\webdev\_testNode
	if ErrorLevel 1 goto :ERR1
	goto END


:ERR1
	grep -Poz "^:ERROR1\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END

:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:ERROR1
Some Error occourred...



