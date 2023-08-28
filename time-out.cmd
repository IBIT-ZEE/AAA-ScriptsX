call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	
	:: PREVENT NON-NUMERIC INPUT
	set /a xTimeout = 0 + %1
	
	if %xTimeout%==0 (
		if NOT defined aaa-Timeout ( AAA-Obs %0 )
		set xTimeout=%aaa-Timeout%
		)

	echo Countdown from %xTimeout% seconds...
	echo,
	echo,
	C:\Windows\System32\timeout.exe /T %xTimeout%
	
	:: CHIME FOR 10 TIMES
	for /L %%f in ( 1 1 11 ) do ( 
		echo 
		C:\Windows\System32\timeout.exe /T 1 >null
		)
		
	exit /b


:OBS
>time-
>timer


	Syntax:
	
		Time-Out <x>

	* seconds to countdown until alarm
	* use AAA-Timeout if available afor flawed-iput
  
