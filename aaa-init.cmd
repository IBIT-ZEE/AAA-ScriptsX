:: AAA-Environment initialization (vars, consoles, etc.)
:: dependencies: %System%\Timeout.exe NirCMD.cmd

CALL aaa-log %0 %*
:: setlocal

:MAIN
	:: VOLATILE $this-Session
	for /F %%f in ('hostname') do set aaa-host=%%f

	:: GLOBALS
	if NOT "%aaa-Env%"=="1" ( Call :VARS )
	:: setlocal

	:: Lock Workstation after 60 seconds
	echo,
	echo,
	start "60 seconds..." aaa-console C:\Windows\System32\timeout.exe 60
	
	call nircmd speak text "Hello... . . . Initializing lock timeout..."
	
	
	:: choice.exe CTRL+C is errorlevel0
	:: here 0 gives errorlevel1, 1 gives errorlevel2, ...
	choice /m "Press:  |>  0=continue...  |  1=Lock!  <|  " /c 01 /d 1 /t 60
	
	:: if choice was not "0-key" then LOCK
	if not %errorlevel%==1 ( 
		rundll32.exe user32.dll,LockWorkStation
		goto :END
		)
	
	:: Starting from .lnk uses !LINKS/X settings
	echo STARTING LINKS...
	start /b "!!!!TEMP" TEMP!.lnk
	start /b "!!!!TEST" TEST!.lnk
	start /b "!!!!TODO" TODO!.lnk	
	:: start /b "!!!!TEMP" %aaa-temp%
	:: Start "Messenger"	LANMessenger.lnk

	
	goto :END


:VARS
	setx aaa-Env 	1
	setx aaa-Host 	%aaa-host%
	setx aaa-Baks 	D:\!!!!BAKS\%aaa-host%
	setx aaa-Logs 	C:\XXX\!!!!LOGS
	setx aaa-Tags 	C:\DAT\$kb\aaa-tags.$kb
	setx aaa-Temp 	C:\XXX\!!!!TEMP
	setx aaa-Test 	C:\XXX\!!!!TEST
	setx aaa-Pool 	C:\XXX\!!!!POOL
	
	setx aaa-Scripts 	C:\DAT\#Scripts
	setx aaa-ScriptsX 	C:\DAT\#ScriptsX
	setx aaa-ScriptsXX 	C:\DAT\#ScriptsXX
	setx aaa-Links 		C:\DAT\#Links
	setx aaa-LinksX 	C:\DAT\#LinksX
	setx aaa-LinksXX 	C:\DAT\#LinksXX
	
	setx aaa-Timeout	5
	
	exit /b 0


:END
	echo,
	echo,
	:: endlocal
	exit /b

:OBS
: