:: AAA 
:: aaa-run <program>
::
:: goals
:: 1. run program & log aaa-log operation

:ENTRY

:MAIN
	Call aaa-log %*
	if "%~1"=="" goto :CATCH1
	
	start "%~1" %*
	
	if ERRORLEVEL 1 goto :CATCH2
	goto :END

:CATCH1
	echo 	AAA-Run ^<program^> [params...]
	echo,
	echo 	* Run and program and log/AAA-* launch ^& errors... 
	goto :END

:CATCH2
	call AAA-Error
	goto :END

:END
	echo,
	echo,
	exit /b