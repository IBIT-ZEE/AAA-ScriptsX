Call AAA-Log %0 %*
	::if "%~1"=="" goto CATCH1
	Setlocal

:MAIN
	:: check if we have minimin state
	:: and data for test elements
	if "%kb-store%"=="" set kb-store=C:\DAT\$KB\AAA-!Tech.$kb
	if "%~1"==""         AAA-Main %~0

	:: set a GLOBAL
	EndLocal
	Set kb-get=%1
	Setlocal
	
	:: grep -z ignore ^ and $ so use \neq
	:: /f matches FF
	:: grep -Pozi "\f\.\S*?%1.*?\.[\w\W]*?\f" "c:\DAT\$KB\AAA-!TECH.$kb"
	set x=grep -Pozi "\f\.%1\.[\w\W]*?\f" %kb-store%
	if "%kb-viewer%"=="" ( %x% ) else ( ''' %x% )
	
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

	KB-Get <?>

		Get the Knowledgebase elements <title>
		for supplied element (*?*)
		from the current %kb-store%
		
		use kb- to set minimum state 
		(e.g. default $kb and viewer)
:
