if "%~1"=="" AAA-MainX %~f0
if not exist "%~1" AAA-Message "folder '%~1' not found"

AAA-LogX mklink /D "%userprofile%\desktop\%~nx1" "%~f1"

:OBS
	Make a Symbolic-Link to a file
	and put the <link> in the current Desktop...
	
	ATT*** Files with '&' not permited...
	
:




