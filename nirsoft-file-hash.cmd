call AAA-Log %0 %*

:BEGIN
	setlocal
	if "%~1"=="-?" ( start "Nirsoft-Hasher" C:\APL\!TOOLS\NirSoft\hashmyfiles.chm & exit /b )
	if "%~2"=="" if NOT "%~1"=="" %~0 /file %1

:MAIN
	start "Nirsoft-Hasher" C:\APL\!TOOLS\NirSoft\x64\hashmyfiles.exe %*

:END
	endlocal