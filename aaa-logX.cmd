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

:: ATT***
:: do not use/call aaa-log.cmd 
:: it will alter %0
:MAIN
	echo ERRORLEVEL%errorlevel% ~ %date%-%time% ~ %cd% >> c:\xxx\!!!!LOGS\aaa-run.log
	echo %* >> c:\xxx\!!!!LOGS\aaa-run.log
	:: start /B %*
	%*

	exit /b

:OBS
	aaa-logX.cmd
	
	log  ->  %errorlevel% ~ %date%-%time% ~ %cd% 
	and  ->  %*
	to   ->  aaa-run.log at c:\xxx\!!!!LOGS
	then ->  %* invoke
:

