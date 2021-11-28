
:INIT
	@echo off
	
	if not exist ".git" (
		AAA-Message ^
			"Current folder does not appear to be a git repository..." ^
			"" ^
			"no .git folder detected..."
		)

	Call AAA-Obs %0
	

:MAIN
	setlocal
	
	if "%~1"=="/force" set xForce=-f

	:: CREATE .7z *
	:: ATT*** delete old .7z
	:: ATT*** excluding .git
	echo [ 1. Create a archive/7z... ]
	for %%f in ( %cd% ) do (set x=%%~nxf)
	if exist %x%.7z ( del /F %x%.7z )
	Call 7z a -xr!.git %x%
	echo,
	echo,
	:: ?ABORT
	call aaa-timeout 10
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,

	:: ADD TO COMMIT
	echo [ 2. Adding new files to commit... ]
	call git add --verbose . 
	:: call git add --verbose --dry-run . 
	echo,
	echo,
	:: ?ABORT
	call aaa-timeout 10
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,

	:: COMMIT
	echo [ 3. Create a commit session... ]
	call git commit --verbose -m "%date%-%time%"
	:: Call git commit --verbose --dry-run -m "%date%-%time%"
	echo,
	echo,
	:: ?ABORT
	call aaa-timeout 10
	choice /m "[ 1=OK | 0=Exit ]" /c 10 /n /t 10 /d 0
	if errorlevel 2 goto :END
	echo,
	echo,	

	:: UPLOAD
	echo [ 4. Uploading changes... ]
	call git push %xForce% --verbose
	:: call git push --verbose --dry-run
	echo,
	echo,
	:: just a rememberenace ;-)
	goto :END


:END
	endlocal
	echo,
	echo,
	exit /b


:Obs

	Full assisted upload

	Steps:
		0. Create archive/.7z git/raw download automation
		1. Add updated and untracked files to commit
		2. Create a commit session named '%date%-%time%'
		3. Upload the changes...
		
	* Use /force to force update or call Git-updateX 
		


