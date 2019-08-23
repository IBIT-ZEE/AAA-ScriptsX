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
C#-*

	*-IDE _______ Set IDE environment
	*-Compile ___ Compiler (csc.exe)

* see .net-
* use .net-pathit to add a binaries path to this session (32 or 64)

: