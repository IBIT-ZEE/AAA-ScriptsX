:: AAA Launcher for XD-POS


:ENTRY
	Call AAA-Log %0 %*


:BEGIN
	REM set aavXDDat=C:\xxx\xd

	
:MAIN
	if "%~1"==""	aaa-main "%~f0"

	set aavXDApp=C:\apl\xd
	if "%~1"=="."	goto APP-%1
	:: if "%1"=="".""	goto APP-%1  &// REM this is for windows .lnk issue

	if "%~1"=="*"	goto LIST
	if "%~1"=="!"	goto FILES
	if "%~1"=="?"	goto INSPECT

	goto DB


:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:DB
	if not exist %aavXDApp%\cfg\%1.ini goto NOINI
	copy /B/V/Y %aavXDApp%\cfg\%1.ini %aavXDApp%\cfg\xd.ini
	if ERRORLEVEL 1 GOTO END

	cd %aavXDApp%\bin\xd
	echo Starting %aavXDApp% ~ %1
	xdwin.exe
	goto END


:LIST
	dir /b/o %aavXDApp%\cfg\*.ini
	goto END


:FILES
	cd %aavXDApp%
	start .
	goto END

:INSPECT
	%aavXDApp%\cfg\xd.ini
	goto END

:NOINI
	echo A configuracao %1 nao existe...
	goto END


:DEBUG
	if ERRORLEVEL1 echo ERRO...
	goto END

:END
	echo,
	echo,
	exit /b


:OBS

	XD-POS <option>
	
	<db> ___ Base-de-dados

	! ______ Abrir pasta de programas
	!! _____ Abrir pasta de dados
	!!! ____ Abrir pasta de dados em consola
	* ______ Lista as bases de dados disponiveis
	? ______ Mostra os "settings" actuais
	= ______ Utiliza a ultima base de dados selecionada

	
:

