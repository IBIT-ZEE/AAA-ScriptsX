call aaa-log %0 %*
	
:MAIN
	setlocal

	echo __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __
	echo   \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/
	iscsicli ListTargetPortals
	echo __/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__
	
	echo,
	
	echo __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __
	echo   \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/
	iscsicli ListTargets
	echo __/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__/\__

	:: <COMMANDS>
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:END
	echo. 
	echo.
	endlocal
	exit /b

:OBS

	ISCSI Targets and Portals
	

