call AAA-Log %0 %*

:MAIN
	
	:: this code 'unsimplyfication/fold'
	:: because after a level#2 deep
	:: launch of external script does not break this script execution
	:: also exit /b was closing console at level#2 deep

	:: code-path#1	
	if "%1"=="" ( if not defined data~file ( AAA-Obs %0 ))

	::code-path#2
	if "%1"=="" ( if "%1"=="" ( AAA-Message "	Property is:" "" "		%data~file%" ))

	::code-path#3
	set data~file=%~1
	echo 	data~file is now %1


:END
	echo,
	echo,
	exit /b 


:OBS
	Syntax:

		data-file [<name>]


	* will get/set data~file property

