Call AAA-Log %0 %*


:ENTRY
	if "%~1"=="" Text-Chunk %~f0 OBS
	setlocal


:CHECKS
	:: ?AAA.System is valid??
	if "%aaa-scripts%"=="" ( AAA-Message "AAA- System variables missing..." )

	:: ?file exists as a Script??
	:: ATT*** only .cmd 
	set x=
	for %%f in ( %aaa-scripts% %aaa-scriptsX% %aaa-scriptsXX% ) do ( 
		if exist "%%f\%~1" ( set x=%%f\%~1 ) 
		if exist "%%f\%~1.cmd" ( set x=%%f\%~1.cmd ) 
			)
		)

	if "%x%"=="" ( AAA-Message "%1/%1.cmd apparently do not exist..." )

:MAIN
	:: :OBS in AAA.Scripts is per-convention the last label
	:: so no need to specify AAA-Text-Chunk <label-end>
	Text-Chunk %x% OBS


endlocal


:OBS
	AAA-Obs <script>
	
	Will show the Script :OBS
	
	By AAA.Scripts convention:
	":OBS" is label indicating the beginning
	of the help text at end-of-file


