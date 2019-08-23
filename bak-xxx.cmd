Call IBITLogo



:MAIN
	echo BAK ^<profile^>
	echo to call a predefined BAK script (*to implement)
	echo.
	
	echo USE BAKDIR ____ to backup directories
	echo USE BAKFILE ___ to backup files
	echo.
	echo.
	
	set /p aaov="Prima ENTER para ver ajuda sobre BAKDIR..."

	call bakdir
	echo.
	echo.
	
	set /p aaov="Prima ENTER para ver ajuda sobre BAKFILE..."
	call bakfile

goto END



:END
	echo.
	echo.
