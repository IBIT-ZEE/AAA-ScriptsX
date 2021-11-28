@call AAA-Log %0 %*

:MAIN
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Volumes:
		echo --------
		docker.exe volume ls
		goto :END
		)

	Echo Volume: %1
	echo,
	docker.exe volume inspect %1
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-Volume <container>


	List docker volumes
	Below is a list of all volumes...



