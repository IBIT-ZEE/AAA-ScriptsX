call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>git-
>git-add
>git-commit
>git-list
>git-status
>git-update


0. ________________________________________


git-list

	to see the files staged in this folder
	...

git-status

	to see git system parameters


1. ________________________________________


git-add

	to stage all files in folder
	(stage then commit)


2. ________________________________________


git-commit

	to send the files to the git repository




3. ________________________________________


git-update

	upload the files to the web





