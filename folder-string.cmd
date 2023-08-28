call AAA-Log %0 %*

:MAIN
	if "%1"=="" ( AAA-Obs %0 )

	echo folder : %2	
	echo string : %1
	echo, 
	findstr /L /m /i /C:"%~1" %2.\*

	exit /b

:OBS
>folder-
>file-
>file-string

	folder-string <string> [folder]
  
	p1	string to find
	p2~	folder to search or assume default