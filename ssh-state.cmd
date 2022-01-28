Call AAA-Log %0 %*

:MAIN
	echo ?service -------------------------------
	sc queryex state= all | grep -A11 -i sshd
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


