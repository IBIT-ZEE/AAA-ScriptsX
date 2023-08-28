

:MAIN
	@echo off
	setlocal
	
	if "%~1"=="-?" ( AAA-Obs %0 )
	if NOT defined git- ( AAA-Obs %0 )
	
	set x=-i
	if "%~1"=="-" set x=

	@curl %x% https://api.github.com/users/%git-name%

	endlocal
	exit /b 0


:OBS
>git-
>git-vars

	Grab information from github
	about the user defined in environment variable git-user

	use "-" to supress headers