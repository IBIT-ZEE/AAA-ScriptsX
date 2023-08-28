
:MAIN
	@echo off
	if "%~1"=="" AAA-Obs %0
	
	taskkill /PID %*
	exit /b




:OBS
>kill.cmd
>process-kill.cmd
>process-killX.cmd


	Syntax :
	
		Kill <pid>
