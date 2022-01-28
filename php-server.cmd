@Call AAA-Log %0 %*


if "%~1"=="" AAA-Message "Syntax:" "" "HTTP-Server-PHP <folder-to-serve>"


:MAIN
        if NOT exist "%~1" AAA-Message "Fail:" "" "Invalid folder..." "" "%1"

        echo    PHP server
        echo    Serving "%1" (%cd%)
        echo    in all interfaces at Port 89...
        echo,
        echo,

		:: use the PHP-Server.lnk to persist HTML-PHP-Server console window settings
        start "%date%-%time%" PHP-ServerX.lnk -S 0.0.0.0:89 -t %*
        start /b "%date%-%time%" microsoft-edge:http://localhost:89
		:: @if "%~1"=="" AAA-Message "Syntax:" "" "PHP-Server <folder-to-serve>"		
		:: sc query w3svc && net stop w3svc
		:: start "%date%-%time%" c:\apl\php64\php.exe -S 0.0.0.0:89 -t %*


:END
        echo,
        echo,