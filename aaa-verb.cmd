call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	
	if NOT defined aaa-ScriptsX ( set aaa-ScriptsX=C:\DAT\#ScriptsX )
	
	echo [ verb -as- Action... ]
	:: if EXIST %aaa-ScriptsX%\*-%~1.* ( dir /b %aaa-ScriptsX%\*-%~1.* & echo, ) else ( echo -none- )
	if EXIST %aaa-ScriptsX%\*-%~1.* ( 
		for %%f in ( %aaa-ScriptsX%\*-%~1.* ) do echo 	%%~nf
		echo,
	) else ( 
		echo 	-none- 
		)

	echo [ verb -as- Classifier... ]
	:: if EXIST %aaa-ScriptsX%\*-%~1-* ( dir /b %aaa-ScriptsX%\*-%~1-* ) else ( echo -none- )
	if EXIST %aaa-ScriptsX%\*-%~1-* ( 
		for %%f in ( %aaa-ScriptsX%\*-%~1-* ) do echo 	%%~nf
		echo,
	) else ( 
		echo 	-none- 
		)



:END
	echo,
	echo,
	exit /b


:OBS
aaa-


	Syntax:

		aaa-verb <verb>

	* list all classes using the indicated verb
	* as final action or grouping child actions


// SAMPLES

	aaa-verb on
	aaa-verb off
	aaa-verb list
