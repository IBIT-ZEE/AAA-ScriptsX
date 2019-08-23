:ENTRY
	CALL AAA-Log %0 %1

	
:INITIALIZE

	
:BEGIN


:MAIN
	Call aaa-main "%~f0"

	echo 	Files:
	echo,
	::for %%f in ( %~dpn0*.* ) do echo 		%%~nf
	for %%f in ( %~dp0*_.cmd ) do echo 		%%~nf

	REM sed -n "/^\.Syntax\./,/^\.\./p" %~pnx0
	goto END


:ERR_SYNTAX
	echo aErrMsg ^<p1^> ^<...^> ^& (...)
	goto END

	
:END
	echo,
	echo,


:FINALIZE

	
:EXIT
	Exit /b


:OBS

	These are all AAA *_ scripts
	Same as AAA-All but Specific to a Brand/Product

:
