call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	if NOT EXIST "%~1" (
		echo %1 folder not found...
		exit /b
		)

	if "%2"=="" ( set xPort=80 ) else ( set xPort=%2 )
	
	echo,
	echo    PHP HTTP server
	echo    Serving "%~1" (%cd%)
	echo    in all interfaces at Port %xPort%...
	echo,
	
	:: iis-off
	:: sc query w3svc && net stop w3svc
	:: C:\APL\php64\php.exe -S 0.0.0.0:80 -t "%~1"

	start "%date%-%time%" c:\apl\php64\php.exe -S 0.0.0.0:%xPort% -t "%~1"
	start /b "%date%-%time%" edge.lnk http://localhost:%xPort%

	goto :END


:END
	echo,
	echo,
	exit /b
	

:OBS
>deno-
>php-
>python-


	Syntax:

		php-server <folder> <port/80>


	* start a http/php server in port 80 bound to 0.0.0.0
	* if <port> is specified listen in the indicated port

