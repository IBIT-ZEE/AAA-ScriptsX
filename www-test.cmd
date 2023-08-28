Call AAA-Log %0 %*


:MAIN
	setlocal
	if NOT defined AAA-Timeout ( set %AAA-Timeout%=5 )
	
	set x=0
	if "%~1"=="-?" ( AAA-Obs %0 )
	if "%~1"==""   ( set x=3 ) else ( set /a x+=%1 )
	if %x%==0      ( AAA-Obs %0 )
	
:MAINX
	:: echo ----------------------------------------
	echo 	-? for help-...
	echo,
	echo hit %x% default-router
	echo hit %x% 1.1.1.1/DNS
	echo hit %x% 8.8.8.8/DNSX
	echo hit %x% google.com
	
	echo,
	
	ping -n %x% 10.0.1.254 ^
		&& ping -n %x% 1.1.1.1 ^
			&& ping -n %x% 8.8.8.8 ^
				&& ping -n %x% google.com ^
					&& tracert -d google.com

	echo,
	echo 	-? for help-...
	echo,
	echo,
	:: echo Timing-out for %AAA-Timeout% seconds...
	:: Timeout.exe %AAA-Timeout%
	:: choice.exe /T 1 /D 0 /C "0q"
	:: if ERRORLEVEL 2 exit /b 0
	
	::echo ----------------------------------------
	::goto :MAINX
	
	endlocal
	exit /b


:OBS
>arp-
>dns
>net-
>ip-
>test-
>wan-
>www-

	Syntax:

		www-test <~n>
	
	<~n> ... number of iteractions per test (default is 5)...
	
	* Test WAN/WWW/Internet access for ICMP, DNS, ...

