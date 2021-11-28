Call AAA-Log %0 %*


if "%~1"=="" AAA-Message "Syntax:" "" "HTTP-Server-Deno <folder-to-serve>"


:MAIN
	if NOT exist "%~1" AAA-Message "Fail:" "" "Invalid folder..." "" "%1"
	
	echo 	Deno/Rust server
	echo 	Serving "%1" 
	echo 	in all interfaces at Port 80...
	echo,
	echo,
	
	sc query w3svc && net stop w3svc
	c:\apl\deno\deno.exe %*
	c:\apl\php64\php.exe -S 0.0.0.0:80 -t %*


:END
	echo,
	echo,

