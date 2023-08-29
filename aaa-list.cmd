@AAA-Obs %0
::@if "%~1"=="/?" ( AAA-Message "try:" "" "AAA-List <wildcard-mix>" )
@Call AAA-Log %0 %*

:MAIN
	setlocal
	set VK_TAB=	

	:: UNIQUE EXTENSIONS *do not work/unfold variable
	:: test AAA-*


	if NOT defined aaa-env ( AAA-Message "AAA-Environment variables not set..." )

	for %%a in ( %AAA-Execs% ) do ( 
		if exist *.%%a (
			echo [%%a/%1*] ^ 
			for %%b in ( %1*.%%a ) do ( 
				echo %%~tb ^| %%~ab ^| %%~zb%VK_TAB% ^| %%~nb	
				)
			echo,
			)
		)

:END
	endlocal
	echo,
	echo,
	exit /b

:: (for %f in (*) do ((if not "%~xf"=="" echo,%~xf) | awk '!x[toupper($0)]++')

:OBS

	2REFACTOR***
	
	need to obtain a unique array of folder extensions
	to aggregate files by type


