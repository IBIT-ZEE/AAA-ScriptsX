:: Template for AAA *- commands
:: Boilerplate/Skeleton for scripts
:: Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

:ENTRY
	setlocal
	CALL aaa-log %0 %*
	::if "%~1"=="" goto CATCH1


:MAIN
	:: if "%~1"=="" goto :CATCH1
	:: enable parameter test 
	:: and jump to :CATCH1 if using parameters
	Call aaa-main "%~f0"

	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" ^
	/V HideIcons ^
	/T REG_DWORD ^
	/D 0 ^
	/F
	
	taskkill /f /im explorer.exe & explorer.exe

	:: if ERRORLEVEL 1 goto :CATCH0
	
	goto END


:CATCH0
	Call AAA-Error %0 %* ~ no GREP or other command error

	Timeout 60
	goto :END


:CATCH1
	:: Call aaa-main "%~f0"
	:: Call aaa-message "Use:" "" "%~n0 <object>"
	goto :END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS
	GUI-Icons-On
	
	Show desktop icons
:
