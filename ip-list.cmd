

:MAIN
	@if "%~1"=="" ( call AAA-Log %0 ) else ( echo off )
	netsh interface ip show config %1

	:: if "%~1"=="" ( call text-chunk %~dpnx0 OBSX OBS )
	if "%~1"=="" ( call AAA-Obs %0 - )

	goto :END


:END
	echo, 
	echo,
	exit /b


:OBS
	AAA/ATT***
	IPs and associated NIC information...
	* pass NIC name as a filter argument

