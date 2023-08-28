

:MAIN
	@echo off
	if "%~1"=="" %0 "*"
	::if "%~1"=="" ( AAA-Obs %0 - )
	::if "%~1"=="" ( call AAA-Log %0 ) else ( echo off )
	::if "%~1"=="" ( call text-chunk %~dpnx0 OBSX OBS )
	
	setlocal
	set x=
	if NOT "%~1"=="*" ( set x=%1 )
	netsh interface ip show config %x%
	AAA-Obs %0 -
	endlocal

	goto :END


:END
	echo, 
	echo,
	exit /b


:OBS
>net-
>nic-
>lan-

	Syntax:
		ip-list *
		ip-list <nic-name>
