@( AAA-Log %0 & type %~f0 )


use:

	git-init
	to initialize a git repository in current folder (context)
	
	git-state
	to check the current context state
	
	git-status
	to check the internal variables
	system/global/local
	
	git-update
	to update the remote repository of the current context
	>git add ...
	>git commit ...
	>git push ...
	using --verbose 
	
	git-config
	to edit the default .gitconfig file
	relying on $home/%USERPROFILE%
	
	git-editor
	to check/change the default editor

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

