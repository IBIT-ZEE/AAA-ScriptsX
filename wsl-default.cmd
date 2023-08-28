

:MAIN
	@call aaa-state %0
	Text-Chunk %~f0 OBS
	exit /b


:Obs
>WSL-List 

	2DO***
	
		~ wsl.exe --set-default <name>
