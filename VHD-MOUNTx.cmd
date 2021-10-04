:ENTRY
	CALL IBIT_LOG

	
:INITIALIZE
	if x%1==x goto ERR_SYNTAX
	set aavTemp=%~d0%~p0%~n0.tmp

:BEGIN


:MAIN
	if not exist "%~1" goto ERR_NOFILE
	echo select vdisk file="%~1" > %aavTemp%
	echo attach vdisk           >> %aavTemp%
	if "%2"=="" goto :MAIN1
	echo select partition 1 >> %aavTemp%
	echo assign letter=%2   >> %aavTemp%
	:MAIN1
	type %aavTemp%
	echo.
	diskpart /s %aavTemp%
	del %aavTemp%
	goto END


:ERR_SYNTAX
	echo %~n0 ^<filename.vhd[x]^> [^<drive-letter:^>]
	goto END

:ERR_NOFILE
	echo ficheiro não encontrado
	echo.
	echo 	"%1"
	goto END
	
:END
	echo. 
	echo.

:FINALIZE

	
:EXIT



