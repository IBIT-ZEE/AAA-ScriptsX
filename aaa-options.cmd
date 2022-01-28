:: AAA options/settings
:: 2022.01.24

:: call AAA-Log %0 %*  


:MAIN 
	@echo off
	if /i "%~1"=="" ( AAA-Obs %0 )

	for %%f in ( PROMPT XXX ) do (
		if /i %%f==%1 goto :MAINX
		)

	AAA-Message "Option %~1 not valid..."
	exit /b 


:MAINX
	call :%1


	goto :END


:PROMPT
	:: $d=date $t=time $p=path $_=new-line ...
	:: prompt $g$p$_
	:: prompt $e[7m$s%USERNAME%$s$l~$s$d$s$t$s~$g$s$p$s$e[0m$_$g$s
	prompt $e[7m$s$s%USERNAME%$s$s$l~$s$s$d$s$s$t$s$s~$g$s$s$p$s$s$e[0m$_$g$s
	
	exit /b


:XXX
	echo -----xxx-----
	
	exit /b



:END
	echo,
	echo,
	exit /b


:OBS
	Syntax:
	
		AAA-Options


	OPTIONS
	=======
	PROMPT ... set the AAA prompt for better view and present relevant information
	XXX ...... testing...


