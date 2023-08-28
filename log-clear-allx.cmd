call AAA-Log %0 %*  


:MAIN
	if "%1"=="" ( AAA-Obs %0 ) 
	exit /b 


:OBS
	Remove log files in ?:\Windows\Logs
	stop services services first...
	ATT*** to folder owner (?System, execute from AUTHORITY\SYSTEM)
	
	cd /d %windir%\System32\winevt\Logs
	
	psexec -s cmd
	net stop "task scheduler"
	net stop eventlog
	md _bak
	move /Y . _bak

	net start task scheduler
	net start eventlog
:
