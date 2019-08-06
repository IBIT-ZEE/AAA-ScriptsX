:: AAA-Environment initialization (vars, consoles, etc.)

CALL aaa-log %0 %*
:: setlocal

:MAIN
	:: VOLATILE $this-Session
	for /F %%f in ('hostname') do set aaa-host=%%f

	:: GLOBALS
	if NOT "%aaa-Env%"=="1" (
		setx aaa-Env	1
		setx aaa-Host	%aaa-host%
		setx aaa-Baks	D:\!!!!BAKS\%aaa-host%
		setx aaa-Logs	C:\XXX\!!!!LOGS
		setx aaa-Tags	c:\dat\$kb\aaa-tags.$kb
		setx aaa-Temp	D:\!!!!TEMP		
		setx aaa-Pool	D:\!!!!POOL
		setx aaa-Timeout	5
		)
	:: setlocal

	:: Starting from .lnk uses .lnk settings
	echo calling links...
	:: Start "ConEmu"		ConEmu.lnk
	:: Start "Messenger"	LANMessenger.lnk

	:: Lock Workstation after 60 seconds
	echo,
	echo,
	start "60 seconds..." aaa-console C:\Windows\System32\timeout.exe 60
	choice /m "Press:  |>  0=continue...  |  1=Lock!  <|  " /c 01 /d 1 /t 60
	
	if %errorlevel%==1 goto :END
	
	:: Lock
	rundll32.exe user32.dll,LockWorkStation
	
	goto :END

:END
	echo,
	echo,
	:: endlocal
	exit /b

:OBS
: