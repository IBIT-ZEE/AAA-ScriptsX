call AAA-Log %0 %*  

:MAIN
	if "%1"=="-?" ( AAA-Obs %0 ) 
	
	sc queryex eventlog
	echo,
	
	sc queryex schedule
	echo,
	echo,
	
	exit /b 


:OBS
>log-status

	Syntax:

		log-state

	* state of schedule -aka- Task scheduler
	* state of eventlog -aka- Windows Event Log