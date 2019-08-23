:ENTRY
	CALL IBIT_LOG %0 %*
	:: if "%1"=="" goto CATCH1
	setlocal


:INITIALIZE


:BEGIN


:MAIN
	set aavTemp=
	set aavTemp=%aavtemp%~ C:\APL\Oracle\VirtualBox\VBoxManage.exe
	set aavTemp=%aavtemp% internalcommands sethduuid $disk$
	echo %aavTemp% (CLIPPED)
	echo %aavTemp% | CLIP
	if ERRORLEVEL 1 goto :CATCH0
	goto END


:CATCH0
	echo ERRORLEVEL%errorlevel% ~ %date%~%time% ~ %cd%
	grep -Poz "^:TEXT0\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:TEXT0

	ERRORLEVEL was > 0
: