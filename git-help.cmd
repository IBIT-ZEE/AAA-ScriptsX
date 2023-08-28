call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>git-
>git-list
>git-add
>git-commit
>git-push

	Git

	Syntax:
	
		git-*

	-init		to initialize a git repository in current folder (context)
	-list		list changes
	-state		?same as list
	-status		show git system properties
	-staged		list staged files for next update
	
	-add		add all non staged files
	-update		to update the remote repository of the current context
	-tracked	files beeing tracked
	
	using --verbose 

	-config	to edit the default .gitconfig file	($home/%USERPROFILE%)
	-editor	to check/change the default editor

	* CREDENTIALS
	git account passwords will be saved in plain text 
	in the global .gitconfig file (for SSH/HTTPS)
		* $home|%USERPROFILE%/<username>/.gitconfig
		* also possible to use an SSH-key for your accounts

	git config --global user.email <email>
	git config --global user.name  <username>
	git config --global user.password <password>
	+
	git config --global credential.helper wincred
	git config --global credential.helper

