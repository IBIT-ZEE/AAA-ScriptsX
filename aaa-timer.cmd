call AAA-Log %0 %*

:INIT
	echo Initiated at %time%...
	echo.
	echo.


:MAIN
	if "%~1"=="" goto :CATCH0

	echo %*
	echo.
	echo.

	%*
	echo.
	echo.

	echo Finalized at %time%
	echo.
	echo.
	
	goto :END

	
:CATCH0
	echo nothing to time...


:END
	exit /b


