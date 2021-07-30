:: AAA internal :: Show Obs and available descendants

:: goals #2
:: 1. Show :Obs messages from script %1 (caller %0)
:: 2. Show related/descendant files
:: * return to caller for extra processing
:: p1 ~ script name in full-path format ( "%~f0" )


:MAIN
	:: if self-calling with no <params> to log... 
	:: then...
	:: rercursive passing <self> as paramenter
	if "%1"=="" ( call aaa-log aaa-main.cmd & aaa-main.cmd %~0 )

	grep -Poz "\n:OBS\K[\w\W]*?(?=\n:)" %~dpn1.cmd
	echo,
	echo,
	echo,

	echo 	Programs:
	echo,
	for %%f in ( %~dpn1*.* ) do echo 		%%~nf

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0

	:: grep -Poz "^:OBS0\K[\w\W]*?(?=^:)" %~f1
	exit /b 0


:CATCH0
	exit /b 1


:OBS
	AAA-Main %~0
	
	AAA-Script environment internal extender

	0. Show organization logo
	1. Show :OBS messages from script %1 ( <caller> = %0 )
	2. Show related/descendant files

	* use AAA-Obs.cmd or AAA-Message.cmd for simpler operations

	p1/1 ~ script name in full-path format ( "%~f0" )


:
