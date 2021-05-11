
Call AAA-Log %0 %*

:INIT
	if NOT "%~1"=="-ok" goto :ERR1


:MAIN
	echo ~ git reset --hard origin/master
	goto :END


:ERR1
	Call AAA-Message ^
		"ATT!!! Operacao delicada..." ^
		"" ^
		"efectua o reset do branch corrente para a instancia <MASTER>..." ^
		"" ^
		"Execute com -OK para forcar a execucao..."

	echo ----------------------------------------
	echo current folder is: %cd%
	echo,
	echo git branch here is:
	call git branch
	echo ----------------------------------------

	:: redundante,,, failsafe!!!
	goto :END


:END
	echo.
	echo.


