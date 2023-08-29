call IBIT_LOG %0 %*


:MAIN
	if "%~1"==""       AAA-Obs %0
	if /i not "%1"=="-go" AAA-Obs %0

	echo AAA::Bootfix
	echo,
	echo Pass c:\boot to Administrators ownership
	echo and attribute full-rights to Adminitrators
	echo,

	:: c:\bootmgr
	Takeown /F c:\bootmgr
	ICACLS  c:\bootmgr /grant administrators:F
	
	:: c:\boot\*
	Takeown /R /F c:\boot
	ICACLS  c:\boot /grant administrators:F /T /C

	echo,
	echo,
	exit /b


:OBS
	AAA::Bootfix

	ATT*** -go to force processing...

