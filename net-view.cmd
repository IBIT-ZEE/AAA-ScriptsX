:ENTRY
	Call IBIT_LOG %0 %*
	

:INIT


:MAIN
	sed -n "/^\.Syntax\./,/^\.\./p" %~pnx0
	goto END


:END
	echo.
	echo.
	exit /B




.Syntax.

net-view


..