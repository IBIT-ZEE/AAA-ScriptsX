call AAA-Log %0 %*


:MAIN 
	if "%2"=="" ( AAA-Obs %0 )
	
	echo Opening %1/host %2/drive...
	echo,
	echo,
	net use \\%1\%2 /user:OEM *
	start   \\%1\%2
	
	exit /b


:OBS
>oem-
>smb-drive


	* oem SMB/drive open
	
	oem-drive <host> <share>
	
	( 2REFACTOR*** to use smb-drive <host> <share> <user> )
	
