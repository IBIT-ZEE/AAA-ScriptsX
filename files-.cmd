setlocal
CALL AAA-Log %0 %*
::if "%~1"=="" goto CATCH1

:MAIN
	Call AAA-Main %~f0%

	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo,
	echo,

	endlocal
	exit /b


:OBS

	ATT*** see also File-* (for single file operations)

	Files-*

		Template for aaa-* scripts (language agnostic)

		*-Open ________ Show shared open files
		*-Open-Loop ___ Repeat foreever with default timeout
		...
:
