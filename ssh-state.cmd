Call AAA-Log %0 %*

:MAIN
	echo ?service -------------------------------
	sc queryex sshd
	echo,
	echo,
	
	echo ?tasks ---------------------------------
	tasklist | grep ssh
	echo,
	echo,

	echo ?ports ---------------------------------
	netstat -ano | grep ":22 "

:END
	echo,
	echo,
	exit /b


:OBS
	SSH state
		. service ?server ?agent
		. tasks (*ssh*)
		. ports (:22)


