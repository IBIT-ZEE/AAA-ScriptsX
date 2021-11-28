@call AAA-Log %0 %*

:MAIN
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		goto :END
		)

	@docker.exe rm %1
	goto :END


:END
	echo Containers:
	echo -----------
	docker.exe ps -all
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-Remove <container-name>


	Remove containers
	use Docker-RemoveX or Docker-Image-Remove for images...
	Below is a list of all containers...



