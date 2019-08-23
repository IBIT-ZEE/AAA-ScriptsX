:ENTRY
	CALL IBIT_LOG %0 %*
	REM if "%1"=="" goto CATCH1
	if "%1"=="" %0 %cd%\*


:INITIALIZE


:BEGIN


:MAIN
	:: for /F "tokens=4" %%f in ('dir c:\dat\#links\%1') do echo %%f
	echo %1
	echo.
	echo.
	
	for %%f in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
		echo [%%f]
		for %%g in ( %%f* ) do ( echo %%~nxg )
		echo.
		)
	
	goto END

	
:CATCH1
	echo List ^<pattern^>
	goto END

	
:END
	echo. 
	echo.


:FINALIZE

	
:EXIT



