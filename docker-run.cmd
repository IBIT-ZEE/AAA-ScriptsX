
:MAIN
	@echo off
	if "%~1"=="" ( 
		Call AAA-Obs %0
		
		echo Images:
		docker.exe images
		goto :END
		)

	docker.exe run -i -t %*
	goto :END


:END
	echo,
	echo,
	exit /b



:Obs

	Syntax:

		Docker-Run <image>


	Samples:
	--------
	docker-run -p 88:80 --rm --name x1 apache


