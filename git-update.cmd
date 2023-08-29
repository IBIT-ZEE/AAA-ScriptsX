call AAA-Log %0 %*

:MAIN
	if "%1"==""    ( AAA-Obs %0 )
	if "%1"=="+++" ( goto :GO )

:END
	echo,
	echo,
	exit /b


:GO
	echo 2DO*** 
	goto :END


:OBS
>git-
>git-add
>git-commit
>git-list
>git-status
>git-update


	MACRO:
	
		git-add ______ to stage all files in folder
		git-commit ___ to send the files to the git repository
		git-upload ___ upload the files to the web

	* do main updating steps in 1 go
