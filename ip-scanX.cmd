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
	Call aaa-main "%~f0"
	::exit /b
	
	:MAIN1
		set x=10.0.0.0
		set x1=
		set x2=
		set /p x1="Enter network/8 (default is %x%)... "
		if defined x1 set x=%x1%
		set /p x2=%x% (OK=Enter)?
	if defined %x2% goto MAIN1
	
	:: strip *.0
	echo,
	echo Scanning %x%/8...
	set x=%x:~0,-2%
	
	for /L %%f in (1, 1, 254) do (
		ping -n 1 -w 1000 %x%.%%f >nul
		if not errorlevel 1 (echo. & echo %x%.%%f)
		<nul set /p=.
		)
	
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


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