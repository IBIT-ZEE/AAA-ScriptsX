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
	exit /b
	
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
	
video- is the root of video related funcionality
mainly using of FFMPEG in his miriad of forms
	*-clear ....... EXIF clean
	*-capture .....
	*-rotate ...... show command line format
	*-rotate1 ..... rotate 90% clockwise
	*-rotate2 ..... rotate 180% (flip)
	*-rotate3 ..... rotate 270% clockwise
	*-stream ......
	*-ToImage ..... Split video in frames
	*-FromImage ... Assemble frames to video


:TEXT0

	video-*

	Template for aaa-* scripts (language agnostic)

	*-method1 ___ short explain...
	*-method2 ___ short explain...
	...


:ERROR0

	An error has occured/0

:


