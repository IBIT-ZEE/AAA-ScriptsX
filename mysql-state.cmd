Call AAA-Log %0 %*

:MAIN
	echo ?service -------------------------------
	sc queryex mysql
	echo,
	echo,
	
	echo ?tasks ---------------------------------
	tasklist | grep mysql
	echo,
	echo,

	echo ?ports ---------------------------------
	netstat -ano | grep ":3306 "

:END
	echo,
	echo,
	exit /b


:OBS
	SSH state
		. service ?server ?agent
		. tasks (*mysql*)
		. ports (:3306)


