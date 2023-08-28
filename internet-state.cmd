call AAA-Log %0 %*


:MAIN
	if "%1"=="-?" ( AAA-Obs %0 )
	route.exe print | grepx "^\s\+0\.0\.0\.0"
	
	if ERRORLEVEL 1 ( echo Default route is absent ^(0.0.0.0^) )
	
	Ping -n 1 1.1.1.1 > nul
	if ERRORLEVEL 1 ( echo Internet appears down   ^(1.1.1.1^) 
		) else (
		echo           1.1.1.1 is accessible...
		)


:END
	echo,
	echo,
	exit /b


:OBS
>ip-
>route-
>www-
>test-

	* State of internet connection