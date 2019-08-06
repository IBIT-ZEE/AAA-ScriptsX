:ENTRY
Call IBIT_Log %0 %*


:INITZ
	set aaaTemp=c:\dat\#scripts

:BEGIN


:MAIN
	start "" %aavtemp%
	start "" "C:\Program Files (x86)\Microsoft VS Code\Code.exe" %aavtemp%
	:: start chrome %aavtemp%\_test.html
	::start chrome http://localhost/_testHTML
	::start "" %aavtemp%
	start "" "scripts!!!.lnk"
	goto :END

:MAINX
	goto :END


:END


:FINALZ
	set aaaTemp=


:EXIT
	exit /b 0


