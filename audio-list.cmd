
:MAIN
	@echo off
	setlocal
	set x=caption,status
	if NOT "%~1"=="" ( set x=%x%,%* )
	@wmic sounddev get %x% /format:table
	endlocal

