call AAA-Log %0 %*


:MAIN
	if NOT "%1"=="" ( AAA-Obs %0 )
	
	:: PROCESSES
	echo PROCESSES
	echo ----------------------------------------
	:: wmic process get * /format: list
	wmic process get handle,sessionId,workingsetsize,virtualsize,name /format:table
	:: ... where (name like '%%%~1%%' ) get processid,priority,name,sessionid,status,threadcount,workingsetsize /format:table
	
	echo,
	echo,

	:: SERVICES
	echo SERVICES
	echo ----------------------------------------
	:: wmic service get * /format: list
	wmic service get name, startmode, state, status

	echo,
	echo,

	:: OS
	echo OS
	echo ----------------------------------------
	echo -------------------- OS
	wmic computersystem get caption, domain, hypervisorpresent, SystemSKUNumber, SystemType, Username
	echo,
	echo -------------------- PRODUCT
	wmic csproduct get caption, vendor, uuid
	echo,
	echo -------------------- AUTORUNS
	wmic startup get command
	
	echo,
	echo,

	:: HARDWARE
	echo HARDWARE
	echo ----------------------------------------
	echo -------------------- BOARD
	wmic baseboard get manufacturer, product, version
	echo,
	echo -------------------- BIOS
	wmic bios get name, version
	
	echo,
	echo,

	:: STORAGE
	echo STORAGE
	echo ----------------------------------------
	echo -------------------- DRIVES
	wmic diskdrive get index, interfacetype, name, caption
	echo,
	echo -------------------- PARTITIONS
	wmic partition get blocksize, bootable, diskindex, name, size
	echo,
	echo -------------------- VOLUMES
	wmic volume get automount, blocksize, deviceid, driveletter
	echo,
	echo,

	exit /b


:OBS

	WMI base

