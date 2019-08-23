:: AAA Launcher for XD-GC Apps

:ENTRY
	Call AAA-Log %0 %*

:INIT
	setlocal
	set aavXDApp=C:\apl\xd

:BEGIN


:MAIN
	if "%~1"==""	aaa-main "%~f0"

	::echo if "%1"=="."	goto APP-%1
	::echo if "%1"=="".""	goto APP-%1  &// REM prevent windows .lnk issue
	if "%1"=="!"	goto :FILES1
	if "%1"=="!!"	goto :FILES2
	if "%1"=="*"	goto :LIST
	if "%1"=="?"	goto :INSPECT

	if not exist %aavXDApp%\cfg\%1.ini goto NOINI
	copy /B/V/Y %aavXDApp%\cfg\%1.ini %aavXDApp%\cfg\xd.ini
	if ERRORLEVEL 1 GOTO END

	cd %aavXDApp%\bin\xdgc
	start XDPeople.GC.Launcher.exe
	goto END


:SYNTAX
	echo grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	goto END

:LIST
	dir /b/o %aavXDApp%\cfg\*.ini
	goto END

	
:INSPECT
	start /b "" %aavXDApp%\cfg\xd.ini
	goto END

:FILES1
	cd /d %aavXDApp%
	start .
	goto END


:FILES2
	cd /d %aavXDApp%\cfg
	start .
	goto END

	
:NOINI
	echo A configuracao %1 nao existe...
	goto END


:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo,
	echo,

:EXIT
	endlocal
	exit /b


:OBS
XD-GC <option> <db> 

	<db> ___ Iniciar XD-GC com a Base-de-dados indicada
	* ______ Lista as bases de dados disponiveis
	? ______ Verifica os "settings" actuais
	= ______ Utiliza a ultima base de dados selecionada
	! ______ Ver pasta de programas
	!! _____ Ver pasta de dados

:


