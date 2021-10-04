:ENTRY
	CALL IBIT_LOG


:INITIALIZE
	if x%1==x goto ERR_SYNTAX
	set aavTemp=%~d0%~p0%~n0.tmp

	
:BEGIN


:MAIN
	if not exist "%~1" goto ERR_NOFILE
	echo select vdisk file="%~1" >  %aavTemp%
	echo detach vdisk            >> %aavTemp%
	type %aavTemp%
	echo.
	diskpart /s %aavTemp%
	del %aavTemp%
	goto END

:ERR_SYNTAX
	echo %~n0 ^<filename.vhd[x]^>
	goto END

:ERR_NOFILE
	echo ficheiro não encontrado
	echo %1
	goto END
	
:END
	echo. 
	echo.

:FINALIZE
	Timeout 10

:EXIT



