Call AAA-Log %0 %*

:MAIN
	echo Images
	echo ------
	@Call docker-images
	echo,
	echo,
	
	echo Containers
	echo ----------
	@Call docker-containers
	echo,
	echo,
