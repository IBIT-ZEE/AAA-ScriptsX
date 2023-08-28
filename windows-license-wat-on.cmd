call AAA-Log %0 %*


:MAIN
	:: if "%1"=="" ( AAA-Obs %0 )
	if /i "%1"=="-GO" goto :GO
	
	AAA-Obs %0
	exit /b


:GO
	echo ***2DO***
	Timeout 60
	goto END


:OBS

	Syntax:

		Windows-WAT-ON -go

	Windows activation on
	ATT*** user must be Administrator

	Restore activation detection 
	in Windows 7 pre-SP1 was a update 971033
	in Windows 7 pos-SP1 use takeown/icacls to restrict access to WAT
