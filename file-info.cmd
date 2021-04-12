:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	:: color 27
	:: mode con: lines=22 cols=88

	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1

:MAIN
	if "%~1"=="" aaa-main "%~f0"
	if not exist "%~1" AAA-Message "file '%~1' not found"
	
	::mode con: lines=16 cols=64
	::echo (c) ZEE 2014 (r) -^> FileInfo
	:: ?Owner
	:: ?Rights
	:: Opened by ???
	echo %~1
	echo %~f1
	echo "%~f1" | clip
	echo,
	echo Size is %~z1
	echo Date is %~t1
	echo Attr is %~a1
	echo DOSName: %~s1
	echo,
	echo * file fullname is in clipboard...
	REM drive: %~d1
	REM pathDir: %~p1
	REM DOSName: %~s1
	
	:: exit here
	aaa-inShell
	
	:: if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:ERROR0\K[\w\W]*?(?=^:)" %~f0
	
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 10
	goto END


:END
	echo,
	echo,

	endlocal
	exit /b


:OBS
	File Information...
: