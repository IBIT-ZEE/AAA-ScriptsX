:: AAA options/settings
:: 2022.01.24

:: call AAA-Log %0 %*  


:MAIN 
	@echo off
	if /i "%~1"=="" ( AAA-Obs %0 )

	:: validate options
	for %%f in ( BANNER PAUSE PROMPT XXX ) do (
		if /i %%f==%1 goto :MAINX
		)

	AAA-Message "Option %~1 not valid..."
	exit /b 


:MAINX
	:: main dispatcher
	call :%*
	goto :END


:_SETTER
	:: if no VALUE then show property content
	if "%~2"=="" ( set %1 & exit /b )
	
	:: 0/1 trigger only
	::if %x:10=%==10  ( echo ERR*** use 0/1... & exit /b )
	if NOT %2==0 if NOT %2==1 ( echo ERR*** use 0/1... & exit /b )

	set %1=%2
	
	:: feedback property content
	set %1
	
	exit /b


:BANNER
	call :_SETTER aaa-options-banner %*
	exit /b


:PAUSE
	call :_SETTER aaa-options-pause %*
	exit /b


:PROMPT
	:: $d=date $t=time $p=path $_=new-line ...
	:: prompt $g$p$_
	:: prompt $e[7m$s%USERNAME%$s$l~$s$d$s$t$s~$g$s$p$s$e[0m$_$g$s
	prompt $e[7m$s$s%USERNAME%$s$s$l~$s$s$d$s$s$t$s$s~$g$s$s$p$s$s$e[0m$_$g$s
	
	exit /b


:XXX
	call :PROPERTY aaa-options-xxx %*
	exit /b



:END
	echo,
	echo,
	exit /b


:OBS
>aaa-state
>aaa-status

	Syntax:
	
		AAA-Options <option> <value>

		* State/Status changing operations

	OPTIONS
	=======
	PAUSE .... pause after AAA-Message ... ON/OFF
	BANNER ... banner display ............ ON/OFF
	PROMPT ... AAA advanced prompt ....... ON/OFF
	XXX ...... testing...
