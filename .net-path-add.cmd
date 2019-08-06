:ENTRY
	:: add to log/history (if enabled in aavLog)
	CALL AAA-LOG %0 %*

	
:INITIALIZE
	if "%1"=="" goto :CATCH1
	set aavTemp=%1
	if "%1"=="32" goto :BEGIN
	if "%1"=="64" goto :BEGIN
	goto :CATCH1


:BEGIN
	:: special cases
	call file-pathed csc.exe
	if not ERRORLEVEL 1 goto :CATCH2

:MAIN
	:: <COMMANDS>
	echo Current path:
	echo %path%
	echo,
	echo,
	set path=%path%;%SystemRoot%\Microsoft.NET\Framework%aavTemp%\v4.0.30319
	echo New path:
	echo %path%

	if ERRORLEVEL 1 goto :CATCH0
	goto END


:CATCH0
	:: catch GREP-NOT-FOUND or other COMMAND error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=:)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %Date% ~ %time ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help
	grep -Poz "\n:OBS\K[\w\W]*?(?=\n:)" %~f0
	Timeout 60
	goto END

:CATCH2
	:: csc.exe is in path (path already set)
	grep -Poz "\n:TEXT2\K[\w\W]*?(?=\n:)" %~f0
	Timeout 60
	goto END
	
:END
	echo,
	echo,

:FINALIZE
	:: cleanup vars
	set aavTemp=

:EXIT
	exit /b


:OBS
.net-path <32/64>

	* add to path .net x32/x64 bit binaries
	
	32 ___ add 32 bits binaries to path
	64 ___ add 64 bits binaries to path

	* using only .net 4.0.x
	* NEED UPDATE TO .net core
: