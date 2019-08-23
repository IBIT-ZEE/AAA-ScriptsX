if "%~1"=="" AAA-MainX %~f0
if not exist "%~1" AAA-Message "file '%~1' not found"

::AAA-LogX 
mklink "%userprofile%\desktop\%~nx1" "%~f1"
pause


:OBS
	Make a Symbolic-Link to a file
	and put the <link> in the current Desktop...
	
	ATT*** Files with '&' not permited...
	
: