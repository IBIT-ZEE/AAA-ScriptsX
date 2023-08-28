call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>net-
>net#

	GUI
	===
	LANBench
	LANSpeed
	NetIO
	NetStress
	+
	net!/_MONITOR
	net!>/TESTING
	

	CLI
	===
	iperf
  
