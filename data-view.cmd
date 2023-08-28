
@Call AAA-Log %0 %*


:MAIN
	:: if NOT defined aaa-data AAA-Message "AAA ecosystem not defined..."
	@if NOT DEFINED aaa-data (set aaa-data=c:\DAT\AAA\Data)

	if "%~1"=="" if not defined data~file AAA-Obs %0
	
	setlocal
	
	:: QUIRK* this unsimplified/fold of code
	:: because of strange behaviour of goto/call %1 ;-/
	if "%~1"=="" ( 
		set x=%aaa-data%\%data~file%.dat
		) else (
		set x=%aaa-data%\%1.dat
		)

	if NOT EXIST %x% ( 
		AAA-Message "O ficheiro %x% nao existe..."
		)

	echo 	File is %x%
	echo,
	cat %x%
	endlocal
	
	goto :END


:END
	echo,
	echo,
	exit /b


:OBS
	Syntax:

		AAA-Edit <datafile>

