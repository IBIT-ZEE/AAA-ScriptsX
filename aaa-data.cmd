call IBIT-Log %0 *%


:INIT
	if "%aaa-data%"=="" AAA-Message "No AAA-Data variable set..."
	if "%~1"=="" goto :LIST

:MAIN
	echo %aaa-Data%
	goto :END



:LIST
	Call AAA-MEssage ^
		"" ^
		"use:" ^
		"" ^
		"AAA-Data <file>" ^
		"" ^
		"- view data-file/.dat contents..." ^
		"- data-files will be searched in %aaa-data%"	

	dir /b %aaa-data%
	goto :END
	

:END
	echo,
	echo,

