call AAA-Log %0 %*


:MAIN
	:: if "%1"=="" ( AAA-Obs %0 )
	if /i "%1"=="-GO" goto :GO
	
	AAA-Obs %0
	exit /b


:GO
	echo Restricting System access to WAT
	echo.
	echo.
	cd %windir%\System32
	takeown /f slui.exe
	takeown /f slwga.dll
	icacls slui.exe /deny *S-1-1-0:(X)
	icacls slwga.dll /grant *S-1-1-0:F
	Timeout 60
	exit /b


:OBS
>windows-

	Syntax:

		Windows-WAT-OFF -go

	Windows activation off 
	ATT*** user must be Administrator

	Remove activation detection 
	in Windows 7 pre-SP1 was a update 971033
	in Windows 7 pos-SP1 use takeown/icacls to restrict access to WAT
