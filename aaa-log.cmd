@echo off & cls
echo    //\\==================================================================//\\
echo   //          /\                                                            \\
echo  //          /__\     ----====::::[[[[ IBIT ArteWare ]]]]::::====----        \\
echo  \\         /\[]/\    ----====::::[[[[ (c) ZEE 2014  ]]]]::::====----        //
echo   \\       /__\/__\                                                         // 
echo    \\//==================================================================\\//
echo,
echo,
if "%~1"=="" ( aaa-obs.cmd %~n0 )

:MAIN
	if NOT defined aaa-logs (
		:: ATT*** do not depend on other aaa-* script
		echo AAA-Log -error- AAA-Logs variable not defined...
		exit /b 1
		)
	
	echo ERRORLEVEL%errorlevel% ~ %date%-%time% ~ %cd% ~ %* >> %aaa-logs%\aaa-run.log

	exit /b 0


:OBS
>aaa-
>aaa-logs
>aaa-logX
>aaa-message
>aaa-obs


	aaa-log.cmd
	
		Log %errorlevel% ~ %date%-%time% ~ %cd% 
		and %*
		to  aaa-run.log in %aaa-logs%
