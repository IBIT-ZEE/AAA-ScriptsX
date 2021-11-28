@Call AAA-Log %0 %1

:MAIN
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Running images:
		echo ---------------
		docker.exe ps
		goto :END
		)

	docker.exe logs %1 --follow --details
	:: docker.exe logs %1 --follow --details --timestamps
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-LogsX <container-id>


	| Show the log for the specified container
	| continuously streaming the log
	| and with extra details



