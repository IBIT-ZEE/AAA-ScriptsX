

:MAIN
	@echo off
	if "%~1"=="" ( 
		call AAA-Obs %0
		call :CHECK
		call :GET
		
		goto :END
		)
	
	if /i "%~1"=="GET"   ( call :GET   & goto :END )
	if /i "%~1"=="SET"   ( call :SET   & goto :END )
	if /i "%~1"=="CHECK" ( call :CHECK & exit /b   )
	
	AAA-Message "Verb not recognized... %1"
	
	goto :END


:END
	exit /b
	echo,
	echo,


:CHECK
	:: OK, continue...
	:: KO, break!!!
	setlocal
	
	:: ?exists aaa-env
	if defined aaa-env ( 
		echo AAA-Environment/AAA-Env is defined...
		) else (
		AAA-Message "AAA-Environment not set..."
		)

	:: exists aaa-host
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
	goto :END


:GET
	set aaa-
	goto :END


:SET
	:: AAA-Environment AAA-* 
	:: context state holders
	:: VOLATILE $this-Session
	for /F %%f in ('hostname') do set aaa-host=%%f

	:: persistent
	setx aaa-Env 	1
	setx aaa-Host 	%aaa-host%
	setx aaa-Server	\\Server0\Stations\%aaa-host%
	setx aaa-Baks 	C:\XXX\!!!!BAKS\%aaa-host%
	setx aaa-Logs 	C:\XXX\!!!!LOGS
	setx aaa-Temp 	C:\XXX\!!!!TEMP
	setx aaa-Test 	C:\XXX\!!!!TEST
	setx aaa-Pool 	C:\XXX\!!!!POOL
	setx aaa-Store 	C:\XXX\!!!!STORE
	
	setx aaa-Scripts 	C:\DAT\#Scripts
	setx aaa-ScriptsX 	C:\DAT\#ScriptsX
	setx aaa-ScriptsXX 	C:\DAT\#ScriptsXX
	setx aaa-Links 		C:\DAT\#Links
	setx aaa-LinksX 	C:\DAT\#LinksX
	setx aaa-LinksXX 	C:\DAT\#LinksXX
	setx aaa-VM			D:\DAT\{vm}

	setx aaa-Execs		"bat cmd lua ps1 py"

	goto :END


:OBS

	AAA Variables...
	
	verbs: GET/SET/CHECK
	
		GET _____ show ALL AAA-* variables set in the system
		SET _____ set  ALL AAA-* variables with persistence
		CHECK ___ verify if the system is a AAA-* ecosystem

		* default by omission is CHECK -then- GET...
		
		ATT***
			only the AAA-Env var is checked
			so other AAA-Vars may be missing



