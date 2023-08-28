
:MAIN
	@echo off
	setlocal
	call AAA-Obs %0
	
	if not defined AAA-Data ( AAA-Message "AAA-Data is not defined..." )
	
	set x=LAN
	echo %x%
	call data-get %AAA-Data%\%x%.dat %1
	
	set x=WAN
	echo %x%
	call data-get %AAA-Data%\%x%.dat %1
	
	call AAA-MessageX

	endlocal	
	exit /b



:OBS
	LAN and WAN IPs
	***************
	
	Classes
	.......
	ip-
	dns-
	ddns-
	route-
	
	Examples
	........
	ip-list
	dns-list
	ddns-check
	route-interfaces

