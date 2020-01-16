Call AAA-Log %0 %*

if "%1"=="" goto     :ERROR
if not exist %1 goto :ERROR


MAIN
	echo localhost:88
	cd %1
	
	c:\apl\Cygwin64\bin\php.exe -S localhost:88
	
	goto :END

:ERROR
	echo 	Wrong or no web folder to publish...


:END
	echo.
	echo.
	



