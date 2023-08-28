call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	
	if NOT EXIST "%~1" (
		echo AAA :: folder not found...
		echo,
		echo 	%1
		goto :END
		)

	:: ?is port argumented
	set xPort=
	if "%2"=="" ( set xPort=80 ) else ( set /a xPort=0+%2 )

	echo,
	echo    Python HTTP server
	echo    Serving "%~1" (%cd%)
	echo    in all interfaces at Port %xPort%...
	echo,

	:: IIS-OFF
	:: sc query w3svc && net stop w3svc
	:: C:\APL\php64\php.exe -S 0.0.0.0:80 -t "%~1"

	start ^
		"%date%-%time%" ^
		c:\apl\python64\python.exe -m http.server %xPort% ^
		--bind 0.0.0.0 ^
		--directory %~1
	
	start /b ^
		"%date%-%time%" ^
		edge.lnk http://localhost:%xPort%

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

		python-server <folder>

	* start a http/php server in port 80 bound to 0.0.0.0
	*




