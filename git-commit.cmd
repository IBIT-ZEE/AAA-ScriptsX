@Call AAA-log %0 %*



:MAIN
	:: TRACKED
	echo Tracked
	echo =======
	Call git-tracked
	echo,
	echo,
	
	:: COMMIT
	echo 2DO***
	call git commit --verbose -m "%date%-%time%"
	echo,
	echo,
	
	:: STAGED
	echo Staged
	echo =======
	Call git-staged


:END
	echo,
	echo,
	exit /b


:Obs

	List tracked files (previously added to track record)
	Commit changes
	Show staged files (ready for upload)

	
	ATT*** 
		Use git-update for full assisted operation
			+ bonus .7z creation for easy git/raw download automation
			.Add
			.Commit with automatic message
			.Upload/Push
