:: Show the :OBS section (if exist) from scripts
:: revs	1st=2020.03.25		prev=2022.01.24		last=2022.01.24

:ENTRY
	if NOT "%~2"=="-"  ( call AAA-Log %0 %* )
	if "%~1"=="" Text-Chunk %~f0 OBS
	setlocal


:CHECKS
	:: ?AAA.System is valid??
	if "%aaa-scripts%"=="" ( AAA-Message "AAA- System variables missing..." )

	set xName=
	set xFile=

	:: ?file exists as a Script??
	:: ATT*** only .cmd 
	if "%~x1"=="" ( set xName=%~nx1.cmd ) else ( set xName=%~nx1 )
	for %%f in ( %aaa-scripts% %aaa-scriptsX% %aaa-scriptsXX% ) do ( 
		if exist %%f\%xName% ( set xFile=%%f\%xName% ) 
		)

	if "%xFile%"=="" (
		AAA-Message ^
			"AAA-Ecosystem:" ^
			"" ^
			"%xName%" ^
			"" ^
			"apparently do not exist in AAA-Ecosystem..."
		)

:MAIN
	:: in AAA.Scripts :OBS is per-convention the last label
	:: so no need to specify Text-Chunk/<label-end>
	Text-Chunk %xFile% OBS

	endlocal
	exit /b




:OBS
	AAA-Obs <script> [-]

	Will show the Script :OBS section

	if "-" is specified as next parameter 
	AAA-Title section will not show...

	in AAA.Scripts:
	":OBS" is label indicating the beginning
	of the help text at end-of-file
	(by convention the last LABEL/SECTION)


