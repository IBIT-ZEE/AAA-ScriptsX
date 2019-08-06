:: AAA eXternal simplification for log operation and show available descendants 
:: >:OBS

:BEGIN
	setlocal
	Call aaa-log %~0 %*	

:MAIN
	:: if no parameter
	:: then recurse for me/itself
	if "%~1"=="" aaa-mainX.cmd %~f0
	
	set x=c:\dat\#scriptsX\%~n1.cmd
	if exist %x% call aaa-main.cmd %x%
	

:END
	echo,
	echo,
	
	endlocal
	exit /b


:OBS
	00:15:5d:ff:18:02	Proxy0
	04:92:26:4e:92:26	Tech8
	00:15:5D:FF:18:0E	WORK
	
	B8-27-EB-48-9B-9F	ZEE-PI	
	04:92:26:4e:91:fa	ZEE-OEM
	7C:8B:CA:01:E2:96	ZEE-PC#NIC1
	18:D6:C7:01:D3:02	ZEE-PC#NIC2

:
	


