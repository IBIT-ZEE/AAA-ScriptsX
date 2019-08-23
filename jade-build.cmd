:ENTRY
	call IBIT_LOG %0 %*

:INITIALIZE
	if "%1"=="" goto :CATCH1
	set aavTemp1=
	set aavTemp2=

:MAIN
	for %%f in (%*) do if EXIST %%f.java (call :PROC1 %%f) else (call :CATCH2 %%f)
	if NOT "%aavTemp2%"=="" goto CATCH3
	javac -cp jade.jar;. %aavTemp1%
	echo compiled %aavTemp1%
	goto :END


:PROC1
	set aavTemp1=%aavTemp1% %1.java
	goto :EXIT

:CATCH1
	echo must specify at least a file to compile...
	goto :END
	
:CATCH2
	set aavTemp2=%aavTemp2% %1.java
	goto :EXIT

:CATCH3
	echo Files missing : %aavTemp2%
	goto :EXIT
	
:END
	echo.
	echo.

	
:FINALIZE
	set aavTemp1=
	set aavTemp2=

	
:EXIT
	exit /b
