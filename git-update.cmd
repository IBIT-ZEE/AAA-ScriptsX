Call AAA-log %0 %*

:INIT
	if not exist ".git" (
		AAA-Message ^
			"Current folder does not appear to be a git repository..." ^
			"" ^
			"no .git folder detected..."
		)

	Call AAA-Message ^
		"1. Add updated and untracked files to commit" ^ "" ^
		"2. Create a commit session named '%date%-%time%'" ^ "" ^
		"3. Upload the changes..."

:MAIN
	setlocal
	echo [ 1. Adding new files to commit... ]
	call git add --verbose . 
	:: call git add --verbose --dry-run . 
	echo,
	echo,

	:: EXIT?	
	call aaa-timeout 60
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,

	echo [ 2. Create a commit session... ]
	call git commit --verbose -m "%date%-%time%"
	:: Call git commit --verbose --dry-run -m "%date%-%time%"
	echo,
	echo,

	:: EXIT?
	call aaa-timeout 60
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,
	
	echo [ 3. Create a archive/7z... ]
	for %%f in ( %cd% ) do ( set x=%%~nxf )
	del %x%.7z
	Call 7z a %x%
	echo,
	echo,
	
	:: EXIT?
	call aaa-timeout 60
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,
	

	:: Exit
	echo [ 4. Uploading changes... ]
	call git push --verbose
	:: call git push --verbose --dry-run
	echo,
	echo,
	:: just a rememberenace ;-)
	goto :END


:END
	endlocal
	echo,
	echo,


