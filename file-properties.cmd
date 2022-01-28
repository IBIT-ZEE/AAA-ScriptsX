

:MAIN
	@echo off
	if "%~1"=="" AAA-Message "Show file properties (WMI/CIM)..."
	if not exist "%~1*" ( AAA-Message "not found..." "" "%~1" )

	setlocal
	set x=%~f1
	:: call set x=%x:\=\\%
	set xx=%x:\=\\%
	
	wmic.exe datafile where "name='%xx%'" get * /format:value
	
	endlocal
	echo,
	echo,


