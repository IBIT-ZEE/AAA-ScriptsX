:ENTRY
	CALL IBIT_LOG %0 %*
	::if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	if ERRORLEVEL 1 goto :CATCH1
	goto END

	
:CATCH1
	echo AAA: Error in GREP invocation
	echo possible lack of GREP in system...
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
GO-*

	*-! ________ AAA MEMONIKS object invocation
	*-main _____ System user initialization
	*-system ___ same as *-main
	

: