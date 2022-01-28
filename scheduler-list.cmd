:ENTRY
	setlocal
	CALL AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1


:MAIN
	call aaa-main %~f0

	schtasks.exe
	
	echo 	Files:
	echo,
	for %%f in ( %~dpn0*.* ) do echo 		%%~nf

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	
	grep -Poz "^:OBS0\K[\w\W]*?(?=^:)" %~f0
	goto END

	
	echo,
	echo,
	endlocal
	exit /b



:OBS
	<command>-*

		Template for aaa-* scripts (language agnostic)

		*-method1 ___ short explain...
		*-method2 ___ short explain...
		...
: