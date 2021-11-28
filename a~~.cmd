@Call aaa-log %0 %*


:MAIN
	setlocal
	if not defined AAA-Execs    AAA-Obs %0
	if not defined aaa-scriptsX AAA-Obs %0

	set x1=%~n0
	set x2=%x1:~,-2%
	echo %x1%
	echo %x2%
	for %%f in ( %AAA-Execs% ) do ( echo %%f )

	endlocal




exit /b
	if not defined aaa-scriptsX ( 
		AAA-Message "AAA-Scripts variable not defined..." ^
		set aaa-
		)

	setlocal
	set x=%~n0
	dir /b %aaa-scriptsX%\%x:~,-2%*-.*
	
	endlocal



:END 
	echo,
	echo,


:Obs

	AAA-Vars not defined (AAA-Execs ...)