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

net-pop3 ^<server^> ^<user^> ^<pass^>

	Access Server and account
	List available mails
	...
	telnet server:110 
	USER user
	PASS password
	LIST
	QUIT

..