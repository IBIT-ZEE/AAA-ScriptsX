

:MAIN
	@echo off

	if /i "%~1"=="NEW" ( goto :ON )
	
	if not defined aaa- (
		:: ATT*** do not depend on aaa-* scripts
		echo,
		echo ************************************************
		echo, 
		echo AAA-Vars -warning- no aaa-* variables defined...
		echo to initialize/persist default AAA-* variables use:
		echo,
		echo 	[ AAA-Environment NEW ] 
		echo,
		echo ************************************************
		echo,
		exit /b 1
		)

	if "%~1"=="" ( AAA-Obs %0 & %~f0 LIST )

	:: sucess goes quiet... error alert with :OBS
	call :%1 || AAA-Timeout 0 && AAA-Obs %0

	goto :END


:END
	echo,
	echo,
	exit /b


:CHECK
	:: OK, continue...
	:: KO, break!!!
	setlocal
	
	:: ?exists aaa-
	if defined aaa- (
		echo AAA-Environment/AAA- is defined...
		) else (
		AAA-Message "AAA-Environment not set..."
		)

	:: ?exists aaa-host
	if defined aaa-host (
		echo AAA-Environment/AAA-Host is %AAA-Host%...
		) else (
		AAA-Message "AAA-Environment/AAA-Host not set..."
		)

	:: ?coherent aaa-host
	for /F %%f in ('hostname') do set x=%%f
	if NOT "%aaa-host%"=="%x%" ( 
		AAA-Message ^
			"Host seems wrong:" ^
			"" ^
			"%x% <> %aaa-host%" 
		)

	endlocal

	::goto :END
	exit /b 0


:LIST
	echo AAA-Variables
	echo =============
	set aaa-
	::goto :END
	goto :EOF


:ON
	:: AAA-Environment AAA-* 
	:: context state holders
	:: VOLATILE $this-Session
	for /F %%f in ('hostname') do set aaa-host=%%f

	:: persistent
	@echo on
	setx aaa-		%date%~%time%
	setx aaa-Host 	%aaa-host%
	setx aaa-Server	\\Server0\Stations\%aaa-host%

	setx aaa-#			C:\APL\!TOOLS\AAA\#
	setx aaa-Scripts 	C:\DAT\#Scripts
	setx aaa-ScriptsX 	C:\DAT\#ScriptsX
	setx aaa-ScriptsXX 	C:\DAT\#ScriptsXX
	setx aaa-Links 		C:\DAT\#Links
	setx aaa-LinksX 	C:\DAT\#LinksX
	setx aaa-LinksXX 	C:\DAT\#LinksXX
	setx aaa-VM			D:\DAT\{vm}

	setx aaa-Data 	C:\DAT\AAA\Data

	setx aaa-Baks 	C:\XXX\!!!!BAKS\%aaa-host%
	setx aaa-Logs 	C:\XXX\!!!!LOGS
	setx aaa-Temp 	C:\XXX\!!!!TEMP
	setx aaa-Test 	C:\XXX\!!!!TEST
	setx aaa-Pool 	C:\XXX\!!!!POOL
	setx aaa-Store 	C:\XXX\!!!!STORE

	setx aaa-Execs		"bat cmd lua ps1 py"
	@echo off

	goto :EOF


:OFF
	:: delete AAA-* 
	echo 2DO*** 
	echo REFACTOR ON/OFF same params
	goto :EOF


:STATE
	:: show state
	:: made some checks
	echo 2DO***"
	goto :EOF



:OBS
>aaa-


	AAA Variables...
	
	verbs: ON/OFF/CHECK/LIST/STATE
	
		ON ______ Set all AAA-* variables with persistence
		OFF _____ Delete all AAA-* variables
		CHECK ___ Verify if AAA-Ecosystem (AAA-*) is present
		LIST ____ Show AAA-Ecosystem variables
		STATE ___ Show state

		* default actions is CHECK -then- LIST...
		
		ATT***
			for processing simplification
			only the AAA- variable is checked
			so other AAA-<vars> may be missing

// SAMPLES
aaa-environment ON
aaa-environment OFF
aaa-environment LIST
aaa-environment CHECK

