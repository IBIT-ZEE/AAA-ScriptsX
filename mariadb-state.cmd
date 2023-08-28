Call AAA-Log %0 %*

:MAIN
	echo ?service -------------------------------
	sc queryex mariadb
	echo,
	echo,
	
	echo ?tasks ---------------------------------
	tasklist | grep mariadb
	echo,
	echo,

	echo ?ports ---------------------------------
	netstat -ano | grep ":3308 "

:END
	echo,
	echo,
	exit /b


:OBS
	SSH state
		. service ?server ?agent
		. tasks (*mariadb*)
		. ports (:3308)


