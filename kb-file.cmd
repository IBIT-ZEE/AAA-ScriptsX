Call AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1
	Setlocal

:MAIN
	if NOT "%~1"=="" goto :MAINX
	
	aaa-main %~f0
	::grep -Poz "^:TEXT1\K[\w\W]*?(?=^:$)" %~f0
	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	
	goto END

:MAINX
	:: ATT*** 
	:: TODO***
	
	:: test if is pre-defined any Knowledgebase
	:: or Message + exit...
	if "%kb-%"=="" ( 
		AAA-Message ^
			"%%kb-%% is not set" ^
			"" ^
			"kb-set %%<name.$kb%%>  ~>  to pre-define a Knowledgebase (.$kb)"
		)
	
	grep -Pozi "\f\.\S*?%1.*?\.[\w\W]*?\f" %KB-%
	:: grep -Poz "\n:OBS\K[\w\W]*?(?=\n:)" %~f1
	:: grep -Pozi "\..*WINDOWS.*\." "C:\DAT\{ZEE}\$KB\((((ZEE)))).$kb"
	:: grep -Pozi "\.\S*?registr.*?\.[\w\W]*?\012\." "C:\DAT\{ZEE}\$KB\((((ZEE)))).$kb"
	goto END
	

:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=^:$)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:END
	echo, 
	echo,

	endlocal
	exit /b



:OBS

	KB-Find <?>

		Find the Knowledgebase elements title 
		for supplied element (*?*)

		...
:

