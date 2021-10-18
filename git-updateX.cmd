@Call AAA-Log %~0 %*


:MAIN
	setlocal
	
	if not exist ".git" (
		AAA-Message ^
			"Aparently not a git folder" ^
			"" ^
			".git not present"
		)
	
	for %%f in (.) do set x=%%~nxf
	
	echo %~$path:7z

:END
	endlocal
	echo,
	echo,
