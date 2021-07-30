Call AAA-Log %0 %*


if "%~1"=="" AAA-Message "Syntax:" "" "HTTP-Server-Python <folder-to-serve>"


:MAIN
	if NOT exist "%~1" AAA-Message "Fail:" "" "Invalid folder..." "" "%1"
	
	echo 	Python server
	echo 	Serving "%1" 
	echo 	in all interfaces at Port 88...
	echo,
	echo,
	
	:: sc query w3svc && net stop w3svc
	echo c:\apl\python64\python.exe ???? -S 0.0.0.0:80 -t %*


:END
	echo,
	echo,

