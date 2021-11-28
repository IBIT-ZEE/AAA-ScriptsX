@Call AAA-Log %0 %*


:MAIN
	if NOT "%~1"=="+++" ( AAA-Obs %0 )
	setlocal
	
	set x=^
		"%USERPROFILE%\.docker" ^
		"%USERPROFILE%\AppData\Local\Docker" ^
		"%USERPROFILE%\AppData\Roaming\Docker" ^
		"%USERPROFILE%\AppData\Roaming\Docker Desktop" ^
		"C:\ProgramData\DockerDesktop"

	for %%f in ( %x% ) do (
		echo %%f
		dir /s/b %%f
		echo,
		)

	choice /M "Eliminar? 1=Yes 0=No" /C 01 /T 10 /D 1
	
	if %errorlevel%==1 ( echo Break... & goto :END )

	for %%f in ( %x% ) do (
		echo %%f/Eliminar...
		del /s /q /f %%f
		rd  /s /q    %%f
		echo,
		)

:END
	endlocal
	echo,
	echo,
	exit /b
	

:Obs

	Syntax:

		Docker-Reset +++


	Cleanup docker files
	+++ is a dummy/seurity enforce parameter

	%USERPROFILE%
		.docker
		.\AppData\Local\Docker
		.\AppData\Roaming\Docker
		.\AppData\Roaming\Docker Desktop
		
		C:\ProgramData\Docker

