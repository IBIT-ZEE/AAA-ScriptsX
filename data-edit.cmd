
@Call AAA-Log %0 %*


:MAIN
	if NOT defined aaa-data AAA-Message "AAA ecosystem not defined..."

	if "%~1"=="" if not defined data~file AAA-Obs %0
	
	setlocal
	
	:: this unsimplified/fold of code
	:: because of strange behaviour of goto/call %1 ;-/
	if "%~1"=="" ( 
		set x=%aaa-data%\%data~file%.dat 
		) else (
		set x=%aaa-data%\%1.dat
		)

	if NOT EXIST %x% ( 
		AAA-Message "O ficheiro %x% nao existe..."
		)

	edit %x%
	endlocal
	
	goto :END


:END
	echo,
	echo,
	exit /b


:OBS
	Syntax:

		AAA-Edit <datafile>


