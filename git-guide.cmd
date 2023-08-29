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


// INFORMATION
git-list ..... show the files staged in this folder
git-status ... show git system parameters


// FILES
git-add ...... stage all files in folder (stage then commit)
git-commit ... send the files to the git repository
git-update ... upload the files to the web





