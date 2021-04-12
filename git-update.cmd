Call AAA-log %0 %*


:MAIN
	echo [ Adding new files to commit... ]
	call git add --verbose . 
	:: call git add --verbose --dry-run . 
	echo,
	echo,
	choice /m "[ 1=OK | 0=Exit ]" /c 01 /n /t 60 /d 0

	:: EXIT?
	if errorlevel 2 goto :END


	echo [ Create a commit session... ]
	call git commit --verbose -m "%date%-%time%"
	:: Call git commit --verbose --dry-run -m "%date%-%time%"
	echo,
	echo,
	choice /m "[ 1=OK | 0=Exit ]" /c 01 /n /t 60 /d 0
	
	:: EXIT?
	if errorlevel 2 goto :END

	:: Exit
	echo [ Uploading changes... ]
	call git push --verbose
	:: call git push --verbose --dry-run
	echo,
	echo,
	goto :END


:END
	echo,
	echo,


