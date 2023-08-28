call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 ) 
	exit /b


:OBS
>AAA-
>windows-


	about Windows Update...

	#1
	. disable Windows update/wuauserv service
	. check <windows>\softwareDistribution
	. HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU
		NoAutoupdate=1/DWORD32
	