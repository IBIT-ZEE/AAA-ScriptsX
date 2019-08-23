:ENTRY
	call IBIT_LOG %0 %*

:INITIALIZE
	if "%1"=="" goto :CATCH1

:MAIN
	if NOT EXIST %1.class goto :CATCH2
	java -cp jade.jar;. jade.Boot %*
	goto :END


:PROC1
	rem set aavTemp1=%aavTemp1% %1.java
	goto :EXIT

:CATCH1
	echo must specify a file to run...
	goto :END
	
:CATCH2
	echo file not exist : %1.class
	goto :END

:END
	echo.
	echo.

	
:FINALIZE

	
:EXIT
	exit /b
