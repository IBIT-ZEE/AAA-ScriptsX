

:MAIN
	@echo off
	wmic.exe nicconfig get Description, InterfaceIndex, MacAddress
	exit /b



:OBS

//
