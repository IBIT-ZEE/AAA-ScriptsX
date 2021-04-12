Call AAA-Log %0 %*

setlocal

set x=c:\APL\!TOOLS\eZimmerman

if "%~1"=="" (
	dir /s/b %x%\*.exe
	
	exit /b

	)



endlocal