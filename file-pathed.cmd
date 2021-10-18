
:ENTRY
	setlocal
	CALL AAA-LOG %0 %*

:INITIALIZE
	set aavErrorlevel=

:BEGIN


:MAIN
	:: Windows use where.exe
	:: Linux use which

	if "%1"=="" goto CATCH1

	:: whith this implementaton filename must be complete (file+ext)
	:: else it wont be found...
	:: so use "where.exe" or "which"
	
	:: search in the $path folders for %1
	set aavTemp=%~$PATH:1
	
	if "%aavTemp%"=="" goto :CATCH3
	echo %aavTemp% (~CLIPPED~)
	echo ~ %aavTemp% | clip
	if ERRORLEVEL 1 goto :CATCH2
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo,
	echo,
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% %cd%
	grep -Poz "^:TEXT2\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END


:CATCH3
	echo 	%~f1
	echo 	not found in ^<path^> folders
	set aavErrorlevel=1
	goto END


:END
	echo,
	echo,


:FINALIZE


:EXIT
	exit /b %aavErrorlevel%
	endlocal


:OBS
File-Pathed <filename.ext>

	* search for <filename.ext> in path and show full path
	* ERRORLEVEL set to 1 if file not found

: