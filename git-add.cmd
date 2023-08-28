call AAA-Log %0 %*


:MAIN
	if "%1"=="-?" ( AAA-Obs %0 )
	
	if NOT exist "%cd%\.git" (
		echo This os not a .git folder
		goto :END
		)
	
	echo Adding...
	git add * --verbose
	
	goto :END


:END
	echo,
	echo,
	exit /b

:OBS
>git-
>git-list

	Syntax:

		git-add
	
	* stage all non-staged files