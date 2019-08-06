:ENTRY
	call ibit_log %0 %*


:INITIALIZE
	set aavObject=%1
	set aavAction=%2

	if not defined aavObject goto ERR_SYNTAX


:MAIN
	set x=%aavObject%%aavAction%
	if not exist %homedrive%\dat\#links\%x%.lnk goto ERR_ABSENT
	start "%x%" %x%
	goto END


:ERR_SYNTAX
	echo go ^<object^> ^<action^>
	echo.
	echo     Action makers
	echo         ! = Files
	echo         %% = Invoker
	echo         $ = Knowledgebase
	echo         # = Links/Shortcuts


:ERR_ABSENT
	echo %x% definiton not exist in ^<#links^>


:END
	echo.
	echo.





:FINALIZE





:EXIT


