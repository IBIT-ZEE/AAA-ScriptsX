:ENTRY
	:: mode con lines=16 cols=80
	CALL AAA-Log %0 %*
	::if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	start now$.lnk		& timeout 1
	start ZEE$.lnk		& timeout 2
	start AAA$.lnk		& timeout 3
	start PINKREEF$.lnk	& timeout 4
	if ERRORLEVEL 1 goto :CATCH2
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo.
	echo.
	echo ERRORLEVEL : %errorlevel%
	echo FOLDER     : %cd%
	grep -Poz "^:TEXT2\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END


:END
	echo,
	echo,


:FINALIZE

	
:EXIT
	exit /b


:OBS
	aaa-initX
	
	loads adititional level programs+files...
: