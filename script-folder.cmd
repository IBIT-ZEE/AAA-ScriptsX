@call AAA-Log %0 %*


:MAIN
	if "%~1"=="-?" ( AAA-Obs %0 )
	
	call AAA-Vars CHECK
	cd /d %AAA-Scripts%
	
	for %%a in ( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ) do (
		echo [%%a]
		for %%b in (%%a*) do echo %%b
		echo.
		)
	
	goto END


:END
	echo. 
	echo.
	exit /b




:OBS

	SCRIPTS-*
	
		Folder ____ Open folder 
		FolderX ___ Open folder extended


