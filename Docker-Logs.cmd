@Call AAA-Log %0 %1

:MAIN
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Running images:
		echo ---------------
		docker.exe ps
		goto :END
		)

	docker.exe logs %1
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-Logs <container-id>


	| Show the log for the specified container
	|
	|



