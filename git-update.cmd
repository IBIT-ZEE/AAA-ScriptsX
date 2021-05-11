Call AAA-log %0 %*


:INIT
	Call AAA-Message ^
		"1. Add all to commit" "" ^
		"2. Create a commit session named '%date%-%time%'" "" ^
		"3. Upload the changes..."

:MAIN
	echo [ 1. Adding new files to commit... ]
	call git add --verbose . 
	:: call git add --verbose --dry-run . 
	echo,
	echo,
	call aaa-timeout
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 60 /d 0

	:: EXIT?
	if errorlevel 2 goto :END


	echo [ 2. Create a commit session... ]
	call git commit --verbose -m "%date%-%time%"
	:: Call git commit --verbose --dry-run -m "%date%-%time%"
	echo,
	echo,
	call aaa-timeout
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 60 /d 0
	
	:: EXIT?
	if errorlevel 2 goto :END

	:: Exit
	echo [ 3. Uploading changes... ]
	call git push --verbose
	:: call git push --verbose --dry-run
	echo,
	echo,
	goto :END


:END
	echo,
	echo,


