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
	if "%~1"=="" goto :CATCH1
	
	:: set xWindow=%x1% - TightVNC Viewer
	set xWindow=%~1 - VNC Viewer
	set xFolder=c:\xxx\!!!!temp
	set xFile=%xFolder%\%xWindow%

	if not exist %xFolder% goto :CATCH1
	
	start "" %xFolder%
	
	:: ATT*** double %% because inside batch
	echo ADJUST FFMPEG STRING TO CAPTURE VIDEO
	echo ffmpeg -f gdigrab -i title="%xWindow%" -r .1 -an -strftime 1 "%%Y-%%m-%%d_%%H-%%M-%%S.png"
	if ERRORLEVEL 1 goto :CATCH0

	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END

:CATCH1
	Call aaa-main "%~f0"
	goto :END

:CATCH2
	echo AAA folder missing... %xFolder%
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

	Video-Record-Window <name>

	Record a stream from designated window with FFMPEG
	to "!!!!TEMP"\<WindowTitle>
	
	ATT***
	Relies on AAA-* vars to get default folders
	
	QUIRKS:
	FFMPEG still not support "FindWindow"
	so round-process must be in place
	to find the FFMPEG -title parameter (based on % - TightVNC Viewer)

:ERROR0

	An error has occured/0

: