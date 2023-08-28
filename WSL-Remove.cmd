:: AAA-Obs %0

:MAIN
	@call aaa-state %0
	Text-Chunk %~f0 OBS
	exit /b


:OBS
>wsl-list
>wsl-import

	2DO***

		Delete/Remove a WSL image

			~ wsl.exe --unregister Kali
