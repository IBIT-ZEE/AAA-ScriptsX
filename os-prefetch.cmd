
if "%~1"=="" (

	Call AAA-Message ^
		"Use:" ^
		"" ^
		"pf <file>" ^
		"" ^
		"Will now change to Windows/Prefetch folder..."
		
	CD /d %SYSTEMROOT%\Prefetch
	
	exit /B
	)

C:\APL\!TOOLS\eZimmerman\PECmd.exe -f %*
