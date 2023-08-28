call IBIT_LOG %0 %*


:MAIN
	setlocal
	
	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#2::Transfer files..." ^
		"" ^
		"ATT^^^ ???"

	if "%1"=="" goto      AAA-Obs %0
	if /i not "%1"=="-go" AAA-Obs %0
	
	:: STOP SERVICES
	:: also unload explorer extensions
	::?7zip.dll and other explorer/.dlls kill explorer.exe" & start explorer.exe
	echo,
	echo,
	Set /p x=[Phase#1::Stop-Blocking-Processes] Press 0 to continue... 
	if not "%x%"=="0" goto :EXIT
	taskkill /f /im "lmc.exe"
	net stop tvnserver
	net stop sbiesvc
	net stop VBoxService

	:: #1 COPY FILES FROM C: -to- K:
	set x=
	echo,
	echo,
	Set /p x=[Phase#1::Copy C-to-K] Press 1 to continue... 
	if not "%x%"=="1" goto :EXIT
	for %%f in (APL DAT SYS XXX) do xcopy /s/v/h/r/e/i/b/c c:\%f k:\%%f
	
	:: #2 CLEANUP TRANSFERED FILES
	echo,
	echo,
	Set /p x=[Phase#2::Clear-Files in {K}] Press 2 to continue... 
	if not "%x%"=="2" goto :EXIT
	for %%f in (APL DAT XXX) do del /s/f/q c:\{K\}%%f

	:: #3 CLEANUP REMAINING FOLDERS
	echo,
	echo,
	Set /p x=[Phase#3::Clear-Folders in {K}] Press 3 to continue... 
	if not "%x%"=="3" goto :EXIT
	for %%f in (APL DAT SYS XXX) do rd /s/q c:\{K\}%%f
	
	goto END


:END
	echo. 
	echo.
	endlocal
	exit /b


:OBS
	AAA-System-Coalescer
		Phase#2::Transfer files
		
		ATT***
		Level 3/Dangerous
		
		Use: -go to force start processing...

