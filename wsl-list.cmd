
Call AAA-Log %0 %*

:: Call AAA-Message "Windows Subsystem for Linux"  ""


wsl.exe --list --all --verbose

echo.
echo Running now...

wsl.exe --list --running

echo.
echo.