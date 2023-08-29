
:MAIN
	@echo off
	
	echo,
	C:\APL\!TOOLS\_SYSTEM\_CONSOLE\OhMyPosh\posh-windows-amd64.exe --config "C:\APL\!TOOLS\_SYSTEM\_CONSOLE\OhMyPosh\_zee.json" %*

	if "%1"=="" ( 
		echo no data to log... 
		) else (
		if NOT defined aaa-logs aaa-message "Error:" "" "	AAA-State.cmd" "" "		AAA-Logs not defined..."
		echo ERRORLEVEL%errorlevel% ~ %date%-%time% ~ %cd% ~ %* >> %aaa-logs%\aaa-run.log
		)

	echo,

