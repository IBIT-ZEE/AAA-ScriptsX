@echo off
cls


:INIT
set aavDebug=1
set aavUser=ZEE-VMX

:MAIN
	set /p aavTemp="Net-address a abrir desktop : "
	set aavTemp=\\%aavTemp%\c$\sys\users\%aavUser%\desktop
	net use %aavTemp% /user:zee-vmx
	start %aavTemp%
	if "%aavDebug%"=="" goto END


:ERRORS
	pause


:END
	echo.
	echo.



