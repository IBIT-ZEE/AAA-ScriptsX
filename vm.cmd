Call AAA-Log %0 %*
Call AAA-Message "Quicker for VM-Show-<Name>" "" "ATT--- Use only the <name> as parameter..."


:MAIN
	if "%1"=="" goto :LIST

	REM if exists one match... then Execute it!!!
	if exist %AAA-ScriptsX%\vm-show-%1.* ( 
		vm-show-%*
		) else (
		goto :ERR1		
		)

	goto :END


:LIST
	for /F %%f in ( 'dir /b %AAA-ScriptsX%\vm-show-*' ) do (
			REM show existing vm-show-???
		echo 	%%~nf
		)
	goto :END


:ERR1
	AAA-Message "A VM %1 nao existe..."
	goto :END


:END
	echo,
	echo,


