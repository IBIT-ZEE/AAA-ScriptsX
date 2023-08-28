call AAA-Log %0 %*


:MAIN
	if NOT "%1"=="" ( AAA-Obs %0 )
	
	:: PROCESSES
	echo ----------------------------------------
	echo PROCESSES
	wmic process get * /format: list
	:: ... where (name like '%%%~1%%' ) get processid,priority,name,sessionid,status,threadcount,workingsetsize /format:table
	echo,
	echo,

	:: SERVICES
	echo ----------------------------------------
	echo SERVICES
	wmic service get * /format: list
	echo,
	echo,

	:: OS
	echo ----------------------------------------
	echo OS
	wmic computersystem get * /format: list
	wmic csproduct      get * /format: list
	wmic startup        get * /format: list
	echo,
	echo,

	:: HARDWARE
	echo ----------------------------------------
	echo HARDWARE
	wmic baseboard      get * /format: list
	wmic bios           get * /format: list
	echo,
	echo,

	:: STORAGE
	echo ----------------------------------------
	echo STORAGE
	wmic diskdrive get * /format: list
	wmic partition get * /format: list
	wmic volume    get * /format: list
	echo,
	echo,

	exit /b


:OBS

	WMI base

