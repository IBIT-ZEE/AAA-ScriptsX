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


:MAIN
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0

	echo,
	echo 	Files:
	echo 	======
	for %%f in ( %~dpn0*.* ) do echo 	%%~nf

	if exist C:\XXX goto :CATCH1 C-SYS-FILES
	
	if exist K:\APL goto :CATCH1 K-APL-FILES
	if exist K:\DAT goto :CATCH1 K-DAT-FILES
	if exist K:\XXX goto :CATCH1 K-XXX-FILES
	
	:: STOP SERVICES
	taskkill /f /im "lmc.exe"
	:: taskkill /f /im "explorer.exe" & start explorer.exe
	net stop tvnserver
	net stop sbiesvc
	net stop VBoxService

	set x=
	echo,
	echo,
	Set /p x=[Phase#1::Copy] Press 1 to continue... 
	if not "%x%"=="1" goto :EXIT
	for %%f in (APL DAT SYS XXX) do xcopy /s/v/h/r/e/i/b/c c:\%f k:\%%f
	
	echo,
	echo,
	Set /p x=[Phase#2::Clear-Files] Press 2 to continue... 
	if not "%x%"=="2" goto :EXIT
	for %%f in (APL DAT XXX) do del   /s/f/q     c:\%%f

	echo,
	echo,
	Set /p x=[Phase#3::Clear-Folders] Press 3 to continue... 
	if not "%x%"=="3" goto :EXIT
	for %%f in (APL DAT XXX) do rd    /s/q       c:\%%f

	echo,
	echo,
	Set /p x=[Phase#4::Link-Folders] Press 4 to continue... 
	if not "%x%"=="4" goto :EXIT
	:: Create Symbolic links to AAA Tree (APL|DAT|SYS|XXX)
	for %%f in (APL DAT SYS XXX) do MkLink /d C:\%%f K:\%%f

	echo,
	echo,
	Set /p x=[Phase#5::Clear-Boot-Stuff] Press 5 to continue... 
	if not "%x%"=="5" goto :EXIT
	
	Takeown /F       c:\boot
	Takeown /R /F    c:\bootmgr
	ICALCS  \boot    c:/grant administrators:F
	ICALCS  \bootmgr c:/grant administrators:F
	del     /f/s/q   c:\boot
	del     /f/s/q   c:\bootmgr
	rd      /s/q     c:\boot

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:ERROR1\K[\w\W]*?(?=^:)" %~f0
	Timeout 60

	set aavErrorlevel=1
	goto END


:EXITX
	grep -Poz "^:ERROR2\K[\w\W]*?(?=^:)" %~f0
	goto :END

	
:EXIT
	grep -Poz "^:ERROR2\K[\w\W]*?(?=^:)" %~f0
	Timeout 60

	set aavErrorlevel=1
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:TEXT0

	AAA-Sys-Coalescence

		Coaslesce AAA-Tree from C: into K:

		...

:ERROR0

	An error has occured


:ERROR1

	Some files already in place (K:\)
	
	SAFE exit designated
	If APL/DAT/SYS/XXX dummies in place
	Please delete them and run again (AAA safegard)
	stop Sandboxie/LANMessenger/TightVNC/7ZIP64(explorer)
	
	Please verify existence in K: of APL/DAT/SYS/XXX

:ERROR2

	Interrupt AAA-Coalescence process optin
	Please verify issues and start again

: