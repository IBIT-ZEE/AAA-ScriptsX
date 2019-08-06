:ENTRY
	CALL IBIT_LOG %0 %*
	rem if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	cd /d C:\APL\PostGRES\bin
	pg_ctl.exe -D c:\dat\postgres -l ..\history.log start
	
	echo Press ^<Ctrl+C^> to end server...
	echo.
	echo.
	tail --lines 20 --follow ..\history.log
	Timeout 10
	
	pg_ctl.exe -D c:\dat\postgres stop
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