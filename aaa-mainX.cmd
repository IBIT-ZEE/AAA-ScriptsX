:: AAA eXternal simplification for log operation and show available descendants 
:: >:OBS


:BEGIN
	setlocal
	Call aaa-log %~0 %*	


:MAIN
	:: if no parameter
	:: then recurse for me/self
	if "%~1"=="" aaa-main.cmd %~f0
	
	:: if %1 ends with '-' 
	::     then list all descendants %1*.*
	:: else
	::    invoke passed-paramenters-%*

	set x=c:\dat\#scriptsX\%~n1.cmd
	if %x:~-5%==-.cmd (	
		if exist %x% ( call aaa-main.cmd %x% %* ) 
		) else ( 
		%* 
		)

	goto :END


:END
	echo,
	echo,
	
	endlocal
	exit /b


:OBS
>aaa-main
>aaa-log

	aaa-mainX <program>

	0. Show organization banner (call AAA-Log)
	1. do other AAA-Log operations ( :OBS/Descendants )

	Parameters:
		p1/1 ~ script name in full-path format ( "%~f0" )

	Dependencies:
		aaa-main.cmd


: