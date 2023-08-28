call IBIT_LOG %0 %*


:MAIN
	setlocal
	
	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#3::Generate links" ^
		"" ^
		"ATT^^^ ???"

	if "%1"=="" goto      AAA-Obs %0
	if /i not "%1"=="-go" AAA-Obs %0
	
	
	:: #3 REMOVE OBSOLETE SYMLINKS
	echo,
	echo,
	Set /p x=[Phase#4::Clear-Symlinks] Press 4 to continue... 
	if not "%x%"=="4" goto :EXIT
	:: rd will only delete the symlynk pointer
	for %%f in (APL DAT SYS XXX) do rd c:\%%f

	:: #4 GENERATE Symbolic links to AAA Tree (APL|DAT|SYS|XXX)
	echo,
	echo,
	Set /p x=[Phase#5::Link-Folders] Press 5 to continue... 
	if not "%x%"=="5" goto :EXIT
	for %%f in (APL DAT SYS XXX) do MkLink /d C:\%%f K:\%%f

	goto END

	
:END
	echo. 
	echo.
	endlocal
	exit /b


:OBS
	AAA-System-Coalescer
		Phase#3::Generate links
		
		ATT***
		Level 3/Dangerous
		
		Use: -go to force start processing...

