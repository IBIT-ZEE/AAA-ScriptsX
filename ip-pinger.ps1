<#
Template for AAA *- commands
Boilerplate/Skeleton for scripts
Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications
#>


"ip-pinger"


<#
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	Call aaa-main "%~f0"

	set xLAN0=LAN: 
	set xWAN1=WAN: 
	set xWAN2=WAN: 
	set xWAN3=WAN: 

	echo,
	echo,
	set x=
	echo [LAN]
	Call :PING zee-pc
	Call :PING zee-oem
	Call :PING server0
	Call :PING Proxy0
	Call :PING Work
	Call :PING WorkX
	Call :PING tech8
	set xLAN0=%xLAN0%%x%

	echo,
	echo,
	set x=
	echo [DynamicDNS/*.dynu.net]
	Call :PING ibit.dynu.net
	Call :PING bordalima.dynu.net
	Call :PING gescofaf.dynu.net
	set xWAN1=%xWAN1%%x%
	

	echo,
	echo,
	set x=
	echo [domain]
	Call :PING pinkreef.pt
	Call :PING bordalima.pt
	Call :PING gescofaf.pt
	Call :PING cinderelaconfeccoes.pt
	set xWAN2=%xWAN2%%x%

	echo,
	echo,
	echo LIVE:
	echo %xLAN0%
	echo %xWAN1%
	echo %xWAN2%

	exit /b

	if ERRORLEVEL 1 goto :CATCH0
	goto END


:PING
	set xIP=
	for /F %%f in ( 'ping /n 1 %1^|grep -o "\[.*\]"' ) do set xIP=%%f
	echo Pinging... %1 -^> %xIP%
	:: start "%1" ping %1
	Start /WAIT "%1" aaa-console Ping %1
	if %errorlevel%==0 (set x=%x% %1)
	
	exit /b 

#>