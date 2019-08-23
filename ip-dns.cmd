:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64

:BEGIN


:MAIN
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	Timeout 60
	goto END

:CATCH2
	:: exception setting ERRORLEVEL
	grep -Poz "^:TEXT2\K[\w\W]*?(?=^:$)" %~f0
	:: return errorlevel1=file-not-in-path
	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b
	endlocal


:TEXT0
An error has occured

:TEXT1
IP-DNS (will CLIP)

	* DNS static, Primary DNS server as well as a secondary one

	ipconfig /displaydns
	
	// DNS -> will show DNS in use
	netsh interface ip show dns	
	netsh interface ip set dns name="LAN1" dhcp
	netsh interface ip set dns name="LAN1" static 192.168.0.250
	netsh interface ip set dns name="LAN1" static 8.8.8.8 index=2

:
