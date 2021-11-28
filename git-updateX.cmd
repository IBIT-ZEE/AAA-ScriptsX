
	

:MAIN
	Call AAA-Obs %0

	setlocal
	
	:: ?ABORT
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	
	git-update /force


:END
	echo,
	echo,
	exit /b


:Obs

	Git-UpdateX will call Git-update /force
	thus forcing the update
	
	useful when the synchronism is lost between origin and master
	
	ATT*** all git/push history is reset...



