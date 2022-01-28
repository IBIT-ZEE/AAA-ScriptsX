::start /b "" C:\APL\Microsoft\Code64\Code.exe %*
:: echo 	[	x = %x%	] & exit /b

:MAIN
	@echo off
	if "%1"=="" AAA-Obs %0
	
	setlocal
	
	:: ?AAA Ecosystem exists??
	call aaa-vars CHECK

	:: ?string has a "-" ??
	set x=%~nx1
	if "%x%"=="%x:-=%" (set x=%aaa-scripts%) else (set x=%aaa-scriptsX%)
	set x=%x%\%~nx1
	
	:: ?NO EXTENSION then default to .CMD??
	:: and put enclose filename in ""
	if "%~x1"=="" ( set x="%x%.cmd" ) else ( set x="%x%" )

	:: ?file already exists??
	:: if not create a <BASIC> script
	if NOT exist %x% (
		echo call AAA-Log %%^0 %%^*>>%x% 
		echo :MAIN>>%x%
		echo 	if "%%1"=="" ^( AAA-Obs %%0 ^)>>%x%
		echo 	%*>>%x%
		echo 	exit /b>>%x%
		echo :OBS>>%x%
		echo 	***2DOx>>%x%
		echo, >>%x%
		)
	edit.cmd %x%

	endlocal
	exit /b



:OBS
	Syntax:

	CodeXX <name> ["<code>"]

	* if script not exists create a new in AAA-Script*	
	* script will be put in <Scripts*> folder
	* if name contains a '-' will go to <ScripsX>

