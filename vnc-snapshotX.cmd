:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

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

	:: xWindow default to TightVNC
	set xName=%~1
	set xWindow=%xName% - VNC Viewer
	set xConfig=C:\DAT\AAA\Credentials\%xName%-real.vnc
	
	if not exist %xConfig% goto :CATCH2

	echo Finding address in the network...
	ping /n 1 %xName% >null
	if errorlevel 1 goto :CATCH3
	
	:: launch VNC window
	:: C:\APL\!TOOLS\_network\_REMOTE\RealVNC5\vncviewer.exe -scaling aspectFit -username=OEM
	:: C:\APL\!TOOLS\_network\_REMOTE\RealVNC5\vncviewer.exe %xConfig%
	:: c:\APL\!TOOLS\_network\_REMOTE\TightVNC\viewer64.exe -password=<password> vmWork
	:: c:\APL\!TOOLS\_network\_REMOTE\TightVNC\viewer64.exe -optionsfile=C:\DAT\AAA\Credentials\vmwork-real.vnc

	if errorlevel 1 goto :CATCH3
	
	:: capture stream from VNC Window
	Start "%xConfig%" C:\APL\!TOOLS\_network\_REMOTE\RealVNC5\vncviewer.exe %xConfig%
	Video-Record-Window %xWindow%
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto :END


:CATCH1
	Call aaa-main "%~f0"
	goto :END

	
:CATCH2
	echo Connection configuration file %xConfig% fot found...
	goto :END

	
:CATCH3
	echo,
	echo %1 was not found in the network...
	goto :END

	
:END
	echo, 
	echo,


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	VNC-SnapshotX <name>

	Capture VNC screenshot from target computer
	Using video-record-window/FFMPEG screenshots


:ERROR0

	An error has occured/0

: