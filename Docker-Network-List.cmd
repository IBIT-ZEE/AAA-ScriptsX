Call AAA-Log %0 %*


:MAIN
	Call AAA-Obs %0
	
	echo Networks:
	echo ---------
	docker.exe network ls
	exit /b


:Obs

	Syntax:


		Docker-Networks


	| Show available docker inter-container networks
	| ?
	| ?



