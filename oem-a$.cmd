call AAA-Log %0 %*


:MAIN 
	if "%1"=="" ( AAA-Obs %0 )
	
	echo Open %1 remote host A$/drive...
	echo,
	oem-drive %1 a$
	exit /b


:OBS
>oem-
>oem-drive


	* oem SMB/drive open
	
	Syntax:
	
		oem-a$ <host>