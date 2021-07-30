:: AAA-Environment AAA-* 
:: context state holders

:MAIN
	:: VOLATILE $this-Session
	for /F %%f in ('hostname') do set aaa-host=%%f


	:: persistent
	setx aaa-Env 	1
	setx aaa-Host 	%aaa-host%
	setx aaa-Baks 	C:\XXX\!!!!BAKS\%aaa-host%
	setx aaa-Logs 	C:\XXX\!!!!LOGS
	setx aaa-Temp 	C:\XXX\!!!!TEMP
	setx aaa-Test 	C:\XXX\!!!!TEST
	setx aaa-Pool 	C:\XXX\!!!!POOL
	
	setx aaa-Scripts 	C:\DAT\#Scripts
	setx aaa-ScriptsX 	C:\DAT\#ScriptsX
	setx aaa-ScriptsXX 	C:\DAT\#ScriptsXX
	setx aaa-Links 		C:\DAT\#Links
	setx aaa-LinksX 	C:\DAT\#LinksX
	setx aaa-LinksXX 	C:\DAT\#LinksXX
	
	
