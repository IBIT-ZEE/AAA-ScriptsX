:ENTRY
	CALL IBIT_LOG
	echo.
	echo.
	echo Starting Remote Desktop Connection for %1...

:INIT
	if "%1"=="" goto ERR_1

:MAIN
	start "TS %1 1000x1000" mstsc.exe /v:%1 /w:1000 /h:1000 c:\dat\!aaa\aaa.rdp
	goto END

:ERR_1
	echo Sintaxe : TS ^<name^>
	goto END

:END
	echo.
	echo.




