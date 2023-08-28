::call AAA-Log %0 %*


:MAIN
	@echo off
	
	if "%1"=="-?" ( AAA-Obs %0 )

	wmic.exe ^
		process ^
			where (name like '%%%~1%%' ) ^
			get processid,priority,name,sessionid,status,threadcount,workingsetsize ^
			/format:table
	exit /b


:OBS
>psX.cmd
>process-listX.cmd


	Syntax:

		ps <*prog*>
