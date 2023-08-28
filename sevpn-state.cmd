Call AAA-Log %0 %*

:MAIN
	echo ?service/server ------------------------
	sc queryex sevpnserver
	echo,
	echo,
	
	echo ?service/client ------------------------
	sc queryex sevpnclient

	echo,
	echo,
	
	echo ?tasks ---------------------------------
	tasklist | grep vpnserver_x64.exe
	tasklist | grep vpnclient_x64.exe
	echo,
	echo,

	echo ?ports ---------------------------------
	netstat -ano | grep ":443 "
	netstat -ano | grep ":5555 "
	echo,
	echo,
	
	exit /b


:OBS
