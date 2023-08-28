call AAA-Log %0 %*


:MAIN
	if /i  "%~1"=="-?"   AAA-Obs %0
	if /i  "%~1"=="OFF" goto :ROUTE~
	if /i  "%~1"=="ON"  goto :ROUTE!
	if NOT "%~1"==""    goto :ROUTEX

:MAINX
	:: default behaviour for no parameters
	:: just show pre-defined default routes
	echo Current default route is:
	echo,
	
	@route print | grepx "^\s\+0\.0\.0\.0"
	
	echo,
	echo 	-? for help
	goto :END


:ROUTE~
	echo Erasing default routes...
	route.exe delete 0.0.0.0
	goto :END


:ROUTE!
	:: recurse with /default/ parameters
	"%~f0" !
	goto :END


:ROUTEX
	call AAA-Ecosystem CHECK
	
	if NOT exist %AAA-ScriptsXX%\me-route-%1.cmd (
		echo 	me-route-%1 script not found...
		goto :END
		)
	
	me-route-%1

	goto :END


:END
	echo,
	echo,
	exit /b


:OBS
>route-
>me-
>me-route-*


	Syntax:
	
		route-default <option>
	
		<none> ... Show defined default routes
		<code> ... Activate route if exists ( me-route-<?> )
			
		-? ....... This information
		-On ...... Activate default if exists ( me-route-! )
		-Off ..... Deactivate all default routes


	* show current default-route/gateway
	* or set a predefined route in me-route-*
	* alias gw/gateway