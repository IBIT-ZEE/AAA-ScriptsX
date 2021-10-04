:ENTRY
	setlocal
	CALL IBIT_LOG %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN
	Call AAA-Message ^
		"AAA-System-Coalescer" ^
		"Phase#2::Transfer files & Generate links" ^
		"" ^
		"ATT^^^ ???"

	if "%1"=="" goto :CATCH0
	if not "%1"=="-go" goto :CATCH0


:MAIN
	
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

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	AAA-message ^
		"" ^
		"ATT!!!" ^
		"Level 3/Dangerous" ^
		"Use: -go to force start processing..."

	::DEAD-CODE
	goto END

	
:EXIT
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b

