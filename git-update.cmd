call AAA-Log %0 %*


:MAIN
	if "%1"=="-?" ( AAA-Obs %0 )

	:: ?IS THIS A .GIT FOLDER
	if not exist ".git" (
		AAA-Message ^
			"Current folder does not appear to be a git repository..." ^
			"" ^
			"no .git folder detected..."
		)

	:: UPLOAD
	echo Uploading...
	echo,
	echo,

	:: call git push --verbose --dry-run --force	
	:: call git push --force --verbose
	call git push --verbose
	echo,
	echo,
	
	exit /b


:OBS
>git-
>git-add

	Syntax:

		git-update

	* test if current-folder is a valid .git repository
	* upload the current .git folder to web
