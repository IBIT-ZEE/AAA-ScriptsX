
:MAIN
	@echo off

	if "%~1"=="" ( AAA-Obs %0 & %~f0 GET )

	if /i "%~1"=="GET"   ( call :GET   & goto :END )
	if /i "%~1"=="SET"   ( call :SET   & goto :END )
	if /i "%~1"=="CHECK" ( call :CHECK & goto :END )
	
	AAA-Message "Verb not recognized... %1"
	
	goto :END


:END
	echo,
	echo,
	exit /b


:CHECK
	:: OK, continue...
	:: KO, break!!!
	setlocal
	
	:: ?exists aaa-
	if defined git- (
		echo Git-Environment is defined...
		) else (
		AAA-Message "Git-Environment not set..."
		)

	endlocal

	exit /b 0


:GET
	echo Current state
	echo =============
	set git-
	
	exit /b 0


:SET
	:: for /F %%f in ('hostname') do set git-host=%%f
	:: persistent
	setx git-		%date%~%time%
	setx git-name 	ibit-zee

	:: goto :END
	exit /b 0


:OBS

	Git- Variables...
	
	verbs: GET/SET/CHECK
	
		GET _____ show variables set in the system
		SET _____ set  variables with persistence
		CHECK ___ verify if main variable (*-) is defined