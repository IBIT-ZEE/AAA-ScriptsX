call AAA-Log %0 %*


:MAIN 
	if "%1"=="" ( AAA-Obs %0 )

	echo 2DO***
	
	exit /b


:OBS
>oem-
>oem-drive


	* copy RDPWRAP.ini to remote
	
	Syntax:
	
		scp 
			C:\APL\!TOOLS\AAA\bin\rdpwrap.ini 
			oem@?:C:\APL\!TOOLS\AAA\bin\rdpwrap.ini