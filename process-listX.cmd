::call AAA-Log %0 %*


:MAIN
	@echo off
	
	if "%1"=="-?" ( AAA-Obs %0 )

	wmic.exe ^
		process ^
			where (caption!='WMIC.exe' AND commandline like '%%%~1%%' ) ^
			get * ^
			/format:value

	exit /b


:OBS
>ps.cmd
>process-list.cmd


	Syntax:

		psX <*prog*>
