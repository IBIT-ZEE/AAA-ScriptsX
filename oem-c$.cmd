call AAA-Log %0 %*


:MAIN 
	if "%1"=="" ( AAA-Obs %0 )
	
	echo Open %1 remote host C$/drive...
	echo,
	oem-drive %1 c$
	exit /b


:OBS
>oem-
>oem-drive


	* oem SMB/drive open
	
	Syntax:
	
		oem-c$ <host>