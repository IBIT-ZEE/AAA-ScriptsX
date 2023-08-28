netsatt Call AAA-Log %0 %*

:MAIN
	echo ?service -------------------------------
	sc queryex mssqlserver
	echo,
	echo,
	
	echo ?tasks ---------------------------------
	tasklist | grep "^sql"
	echo,
	echo,

	echo ?ports ---------------------------------
	netstat -ano | grep ":1433 "

:END
	echo,
	echo,
	exit /b


:OBS
	MSSQL state
		. service ?server ?agent
		. tasks (*mssqlserver*)
		. ports (:1433)


