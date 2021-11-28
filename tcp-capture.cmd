:ENTRY
	setlocal
	CALL AAA-Log %0 %*
	if "%~1"=="" goto :MAIN
	goto :MAINX

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	AAA-Obs %0
	:: grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	if ERRORLEVEL 1 goto :CATCH0
	goto :END


:MAINX
	"C:\APL\!TOOLS\_network\_INSPECT\Wireshark64\tshark" %*
	goto :END

	:: move to program folder 
	:: and display available interfaces
	endlocal
	cd /d "C:\APL\!TOOLS\_network\_INSPECT\Wireshark64"
	setlocal
	
	tshark -D

	:: <COMMANDS>

	
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
	endlocal
	exit /b



:TEXT0

An error has occured



:OBS

	TCP-Capture-*
	* uses TShark, TCPDump, etc.

	*-IP ____ ip
	*-IPX ___ ipx
	*-TCP ___ 
	*-UDP
	*-ARP
	
	DNS
	FTP
	HTTP
	HTTPS
	TFTP


:
