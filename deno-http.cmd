call AAA-Log %0 %*


:MAIN
	echo 2DO***
	goto :END
	
	
	if "%1"=="" ( AAA-Obs %0 )
	if NOT EXIST "%~1" (
		echo AAA :: folder do not exist...
		echo,
		echo 	%1
		goto :END
		)

	echo,
	echo    Deno HTTP server
	echo    Serving "%~1" (%cd%)
	echo    in all interfaces at Port 80...
	echo,
	start "%date%-%time%" C:\APL\!TOOLS\AAA\bin\deno.exe http-server.ts
	echo,
	start /b "%date%-%time%" microsoft-edge:http://localhost:80

	goto :END


:END
	echo,
	echo,
	exit /b
	

:OBS
>php-
>python-


	Syntax:

		deno-http <folder>

	* start a http/php server in port 80 bound to 0.0.0.0
	* 




