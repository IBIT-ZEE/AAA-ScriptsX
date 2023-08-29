@Call AAA-Obs %~0


:MAIN
	Call AAA-Obs %0
	
	echo TESTS
	echo -----
	echo 1. ?AAA-Ecosystem
	call AAA-Ecosystem CHECK
	echo,
	
	echo 2. 
	echo,

	
	goto END

	
:END
	echo,
	echo,
	endlocal
	exit /b


:OBS
TESTS/2DO***
	
	Check for AAA-Variables
	Check for AAA-Folders (!!!!LOGS !!!BAKS)

	check for Poweshell 5/7
	check for VBS
	check for Python
	check for C# Script
	check for Deno/JS
	
	check for GNU
	check for Cygwin
	check for Sysinternals
	check for Nirsoft

	ALIAS check
	Check systems local/remote on start
	
	by WMI local info
	by WMI Remote info
	by PING/Connect remote machines
	by PowerShell remote
