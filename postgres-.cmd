:ENTRY
	CALL IBIT_LOG %0 %*
	rem if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
PostGRE-*

	*-On
	*-Off
	*-Bin   //  *!
	*-Data  //  *!!
	*-Cmds  //  *!!!

: