:: Show the :OBS section from scripts (if exists)
:: revs	1st=2020.03.25		prev=2022.01.24		last=2022.01.24


:ENTRY
	if not defined aaa- (
		echo AAA-Obs -error- aaa-* variables not defined...
		exit /b 1
		)

	:: if NOT "%~2"=="" ( if NOT "%~2"=="-" ( AAA-Log %0 %* ))
	if NOT "%~2"=="-" ( call AAA-Log %0 %* )
	if "%~1"=="" Text-Chunk %~f0 OBS
	setlocal


:CHECKS
	:: ?AAA.System is valid??
	:: 2DO*** use aaa-vars CHECK
	if "%aaa-scripts%"=="" ( 
		AAA-MessageX ^
			"	AAA-Obs" ^
			"" ^
			"		AAA- System variables missing..." 
		)

	:: ATT*** %1 can be a <name> or a <name.ext>
	set xName=
	set xType=
	set xFile=
	set xNotes=

	:: ?file exists as a Script??
	:: ATT*** only .cmd 


	:: default to .cmd extension if none specified
	set xName=%~n1
	if "%~x1"=="" ( set xType=.cmd ) else ( set xType=%~x1 )
	
	for %%f in ( %aaa-scripts% %aaa-scriptsX% %aaa-scriptsXX% %aaa-#% ) do ( 
		if exist %%f\%xName%%xType% (
			set xFile=%%f\%xName%%xType%
			set xNotes=%%f\%xName%.txt
			) 
		)
	
	if "%xFile%"=="" (
		AAA-Message ^
			"AAA-Ecosystem:" ^
			"" ^
			"	%xName%" ^
			"" ^
			"	apparently do not exist in the ecosystem..."
		)


:MAIN
	:: in AAA.Scripts :OBS is per-convention the last label
	:: so no need to specify Text-Chunk/<label-end>
	call Text-Chunk %xFile% OBS
	if exist %xNotes% (
		echo =========
		echo Notes/$kb
		echo ---------
		more %xNotes%
		)


:END
	endlocal
	echo,
	echo,
	exit /b


:OBS
>aaa-
>aaa-log
>aaa-message
>aaa-vars


	AAA-Obs <script> [-]

		Will show the Script :OBS section

		if "-" is specified as next parameter 
		AAA-Title section will not show...
		
		if exists a <script>.txt
		will be displayd after the :OBS section

		in AAA.Scripts:
		":OBS" is label indicating the beginning
		of the help text at end-of-file
		(by convention the last LABEL/SECTION)


// DEPENDENCIES
aaa- variables


// SAMPLES
aaa-obs aaa-vars
aaa-obs git-user

