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

	set xFolder=C:\xxx\!!!!desk\%1
	set xPass=c:\dat\aaa\.vncpass

	echo Finding address in the network...
	ping /n 1 %1 >null
	if errorlevel 1 goto :CATCH2
	
	:: check and open output folder
	if not Exist %xFolder% md %xFolder%
	start "" %xFolder%
	if errorlevel 1 goto :CATCH3
	
	:: capture a frame every 10sec, 1000 frames
	vncsnapshot.exe -passwd %xPass% -count 1000 -fps 10 %1 %xFolder%\shot.jpg
	
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
	exit /b

	goto :END

	
:CATCH2
	echo,
	echo %1 was not found in the network...
	goto :END

	
:CATCH3
	echo,
	echo Can not find/create %xFolder%
	goto :END

:END
	echo, 
	echo,


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	VNC-Snapshot <name>
	
	requires:
		<TEMP!> \ <name>   -=> xFolder
		<AAA!>	\ .vncpass -=> xPass

	Capture VNC screenshot from target computer
	a Frame every 10 seconds for 1000 frames (10/1000)
	using VNCSnapshot.exe (TightVNC 3.x compatible)
	
:ERROR0

	An error has occured/0

: