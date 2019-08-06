:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify Console+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	:: check if PC-NAME is supplied
	if "%~1"=="" ( Call aaa-main "%~f0" & goto :END )
	
	:: check if PC-NAME is reachable
	set x1=%1
	:: set x2=%x1% - TightVNC Viewer
	set x2=%x1% - VNC Viewer
	set x3=c:\xxx\!!!!desk\
	
	:: is computer name valid
	echo Find computer on network...
	ping -n 1 %1% >nul
	if errorlevel 1 goto :CATCH1
	
	:: viewer64.exe -optionsfile=C:\DAT\AAA\Credentials\miguel-tightvnc.vnc
	if not exist %x3%\%x1% md %x3%%x1%
	cd /d c:\xxx\!!!!desk\%x1%
	start "vnc-%x1%" c:\xxx\!!!!desk\%x1%
	if ERRORLEVEL 1 goto :CATCH0
	
	:: ATT*** double %% because inside batch
	ffmpeg -f gdigrab -i title="%x2%" -r .1 -an -strftime 1 "%%Y-%%m-%%d_%%H-%%M-%%S.png"
	if ERRORLEVEL 1 goto :CATCH0
	
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	echo PC %1% is not present in network...
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	
	Obs...


:TEXT0

	Video-Record-Window-VNC

	Record a VNC stream from a designated window
	
	***QUIRKS***
	FFMPEG still not support "FindWindow"
	so round-process must be in place
	to find the FFMPEG -title parameter (based on % - TightVNC Viewer)

:ERROR0

	An error has occured/0

: