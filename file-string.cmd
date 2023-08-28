call AAA-Log %0 %*

:MAIN
	if "%2"=="" ( AAA-Obs %0 )

	echo file   : %2
	echo string : %1
	echo,
	findstr /L /N /i "%~1" "%~2"

	exit /b

:OBS
>file-
>folder-
>folder-string

	file-string <string> <file>
  
	p1	string to find
	p2	file to search
