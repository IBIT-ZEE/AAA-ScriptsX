

:MAIN
	@echo off
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Images:
		echo -------
		docker.exe images
		goto :END
		)

	@docker.exe rmi %1
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-RemoveX <container-name>


	Remove images
	Below is a list of all images...



