@echo off & cls
echo    //\\==================================================================//\\
echo   //          /\                                                            \\
echo  //          /__\     ----====::::[[[[ IBIT ArteWare ]]]]::::====----        \\
echo  \\         /\[]/\    ----====::::[[[[ (c) ZEE 2014  ]]]]::::====----        //
echo   \\       /__\/__\                                                         // 
echo    \\//==================================================================\\//
echo,
echo,
if "%~1"=="" aaa-main %~f0

:MAIN
	echo ERRORLEVEL%errorlevel% ~ %date%-%time% ~ %cd% >> c:\xxx\!!!!LOGS\aaa-run.log
	echo %* >> c:\xxx\!!!!LOGS\aaa-run.log

	exit /b

:OBS
	aaa-log.cmd
		Log %errorlevel% ~ %date%-%time% ~ %cd% 
		and %*
		to  aaa-run.log in c:\xxx\!!!!LOGS
: