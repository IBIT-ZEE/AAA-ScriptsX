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
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	:: Call aaa-main "%~f0"
	
	:: Variables definition
	Call aaa-time
	
	set xPhase=Main...
	set xFolder=c:\apl\cygwin64
	set xFile=setup-x86_64.exe
	set xURL=http://www.cygwin.com/setup-x86_64.exe

	:: ?cygwin folder exists??
	if NOT exist %xFolder% goto :CATCH1

	set xPhase=Change context to folder...
	cd /d %xFolder%

	set xPhase=Preserve file %xFile%+%date%...
	ren %xFile% %xFile%_%aaa-date%-%aaa-Time%.bak

	set xPhase=Get update from %xURL%...
	wget %xURL%

	set xPhase=Correct file rights...
	icacls %xFolder%\%xFile% /reset

	set xPhase=Open folder...
	start "%date%~%time%" %xFolder%

	if ERRORLEVEL 1 goto :CATCH0

	Timeout 10
	
	goto END


:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END

:CATCH1
	:: Call aaa-main "%~f0"
	:: Call aaa-message "Use:" "" "%~n0 <object>"
	Call aaa-message "%x%" "" "not existent..."
	goto :END

:END
	echo. 
	echo.

:FINALIZE
	
:EXIT
	endlocal
	exit /b

:OBS
	<command>-*

	Template for aaa-* scripts (language agnostic)

	*-method1 ___ short explain...
	*-method2 ___ short explain...
	...
: