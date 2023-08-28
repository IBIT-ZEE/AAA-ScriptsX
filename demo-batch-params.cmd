call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	
	::--------------------PARMS--------------------
	set xObject=php-http
	set xProps=-folder -port

	:: CLEANUP
	for %%a in ( %xProps% ) do ( set %xObject%%%a=)

	:: SET PROPERTIES | DISCARD NON-VALID PARAMETERS
	:PARMS
		if /i "%1"=="" ( goto :PARMX )
		for %%a in ( %xProps% ) do ( if %%a==%1 ( set %xObject%%%a=%2 ) )
		shift
		shift
	goto :PARMS
	
	::--------------------PARMS--------------------

	:PARMX
	:: CHECKUPS
	::
	if NOT DEFINED php-http-port   ( set php-http-port=80 )
	if NOT DEFINED php-http-folder ( set php-http-folder=. )
	pause
	if NOT EXIST %php-http-folder% (
		echo AAA::ERROR folder not found...
		echo,
		echo 	%php-http-folder%
		goto :END
		)
	
	echo,
	echo    PHP HTTP server
	echo    Serving %php-http-folder%
	echo    in all interfaces at Port %php-http-port%...
	echo,
	
	:: iis-off
	:: sc query w3svc && net stop w3svc
	:: C:\APL\php64\php.exe -S 0.0.0.0:80 -t "%~1"

	if "%2" == "" ( set x=80 ) else ( set x=%2 )
	echo start "%date%-%time%" c:\apl\php64\php.exe -S 0.0.0.0:%x% -t "%~1"
	echo start /b "%date%-%time%" edge.lnk http://localhost:%2%

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

		php-http -folder <folder> [ -port 80 ]


	* start a http/php server bound to 0.0.0.0 by default in port 80
	* if -port is specified listen in the indicated port

