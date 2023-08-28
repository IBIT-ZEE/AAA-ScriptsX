call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>folder-

	***2DO***
	takeown /a /r /d Y /f %1
	icacls %1 /grant administrators:f /t
	rd /s /q %1 
	id exist %1 ( echo fail... )

	***???***
	icacls /takeown ...

