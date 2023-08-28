call AAA-Log %0 %*
:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	
	if not exist "%~1" ( AAA-Message "%~1 not founf..." )
	
	c:\apl\!TOOLS\____CLI\Cygwin64\tail.exe --follow "%~1"
	
	exit /b


:OBS
>file-


	Syntax:

		file-tail file
  
  
	* start monitoring/display file appends
