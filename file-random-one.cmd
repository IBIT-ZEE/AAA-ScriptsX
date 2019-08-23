:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1

	
:INITIALIZE
	:: prompt ^> 
	:: set aavShell=0
	:: call !isShell.cmd
	:: if errorlevel 1 set aavShell=1
	:: if %aavShell%==1 mode con lines=8 cols=64


:BEGIN


:MAIN
	:: Call aaa-main "%~f0"
	:: exit /b
	
	echo ///////////////////////////////////////////////////////////////////////
	echo TEST UNIT  ?P1=dir  ?P2=.type  ?P3=%
	echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	set xDir="d:\(audio) %%MP3"
	set xFilter=*.mp3
	set xRange=50
	set xCount=0
	
	:: count all files to xCount
	:: draw a random number within 1..xCount as xhit
	:: traverse files until xHit
	
	:: if "%~1"=="" ( set xDir=. ) else ( set xDir=%1 )
	if not exist %xDir% goto :CATCH1

	for /R %xDir% %%f in ( "%xFilter%" ) do ( 
		call :GO "%%~nf"
		)
		:: if errorlevel 1 exit /b 		
		:: )

	if ERRORLEVEL 1 goto :CATCH0
	goto END


:GO
	:: if %random:~0,2%==%xRand% ( set /A xCount=%xCount%+1 & echo %xCount% -^> %1 )
	:: xHit is a target for 1..xRange
	set /A xHit=%random% %% %xRange%
	:: if %xHit%==1 ( set /A xCount=%xCount%+1 & echo %xCount% -^> %1 & exit /b )
	if %xHit%==1 ( 
		set /A xCount=%xCount%+1
		echo %xCount% -^> %1
		)
		:: exit /b 1
		:: )

	exit /b 

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: folder not exists
	echo %x%
	echo not found...

:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:OBS0
	
	Obs...


:TEXT0

	<command>-*

	Template for aaa-* scripts (language agnostic)

	*-method1 ___ short explain...
	*-method2 ___ short explain...
	...


:ERROR0

	An error has occured/0

: