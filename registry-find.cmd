Call AAA-Log %0 %*


:MAIN
	if "%~1"=="" ( AAA-Obs %0 )

	for %%f in ( HKLM HKCU HKCR HKU HKCC ) do (
		echo [%%f]
		reg.exe QUERY %%f /s /f %1
		echo,
		echo,
		)

	echo,
	echo,
	exit /b



:Obs
	Syntax:
	
		Registry-Find <string>

	Search hives for supplied data
	>Registry-Hives

