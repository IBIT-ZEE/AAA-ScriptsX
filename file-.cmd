:ENTRY
	call IBIT-LOG %0 %*

:INITIALIZE


:BEGIN


:MAIN
	::grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	aaa-main "%~f0"
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT0

	Files-* (for file collections operations)

:OBS0

Implement:

	Update ... Update target folder from original
	Open ..... FS Managment console
	OpenX .... NirSoft ???
	Opened ... NirSoft ???
	Owner .... ?how owns it
	Rights ... ?what rights are set
: