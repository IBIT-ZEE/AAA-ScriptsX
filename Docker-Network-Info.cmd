@Call AAA-Log %0 %*


:MAIN
	if "%~1"=="" (
		Call AAA-Obs %0
		
		echo Networks:
		echo ---------
		docker.exe network ls
		goto :END
		)
	
	docker.exe network inspect %1
	goto :END

:END
	endlocals
	echo,
	echo,
	exit /b
	


:Obs

	Syntax:


		Docker-Network <network-id>


	| Show information about specified network
	| ?
	| ?



