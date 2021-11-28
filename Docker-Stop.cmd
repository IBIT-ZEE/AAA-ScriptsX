

:MAIN
	@echo off
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Running images:
		echo ---------------
		docker.exe ps
		goto :END
		)

	docker.exe stop %1
	goto :END


:END
	echo,
	echo,
	exit /b


:Obs

	Syntax:

		Docker-Stop <image-id>



