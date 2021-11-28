

if "%~1"=="" ( AAA-Obs %0 )


:MAIN
	@docker.exe image history %*
	echo,
	echo,
	exit /b


:AAA-Obs

	Syntax:

		Docker-History <image-id*>


