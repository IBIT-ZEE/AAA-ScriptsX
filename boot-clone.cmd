call AAA-Log %0 %*

:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>boot-

	// BCD-CLONE
	bcdedit.exe /export e:\efi\microsoft\boot\bcd
	bcdedit.exe /store e:\efi\microsoft\boot\bcd
