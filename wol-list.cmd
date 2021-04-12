:: Show WOL default data/*.dat file (AAA/Data)
:: >:OBS

:BEGIN
	setlocal
	Call aaa-log %~0 %*	

:MAIN
	type %aaa-data%\wol-go.dat	
	

:END
	endlocal
	echo,
	echo,
	exit /b
