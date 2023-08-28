call AAA-Log %0 %*


:MAIN
	:: if "%1"=="" ( Call AAA-Obs %0 )
	Call AAA-Obs %0

	for %%f in ( %* ) do ( echo %%f )
	pause
	
	exit /b


:OBS
>file-
>clipboard-

	File-processor

	Template to process argumented files 
	Copy to new scriipt and re-program...

