


:MAIN
	@echo off
	if "%~1"=="" AAA-Obs %0
	if "%~2"=="" %0 %1 80

	c:\apl\!TOOLS\Sysinternals\psping.exe %1:%2

	exit /b


:OBS
	HTTP-Pinger <ip> [<port>]

	ATT*** if port not specified 80/HTTP will be assumed


