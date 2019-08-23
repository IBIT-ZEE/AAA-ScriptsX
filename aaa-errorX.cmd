@echo off & cls
echo    //\\==================================================================//\\
echo   //          /\                                                            \\
echo  //          /__\     ----====::::[[[[ IBIT ArteWare ]]]]::::====----        \\
echo  \\         /\[]/\    ----====::::[[[[ (c) ZEE 2014  ]]]]::::====----        //
echo   \\       /__\/__\                                                         // 
echo    \\//==================================================================\\//
echo,
echo,

if "%~1"=="" (
	echo 	No data to log...
	exit /b
	)

:: show messages to user
echo 	%date%-%time% ~ ERRORLEVEL%errorlevel% ~ %username% ~ %cd%
echo 	%*

:: log into !!!!LOGS.aaa-error_log
:: aaa-error "%~1"
echo %date%-%time% ~ ERRORLEVEL%errorlevel% ~ %username% ~ %cd% >> c:\xxx\!!!!LOGS\aaa-error.log
echo %* >> c:\xxx\!!!!LOGS\aaa-error.log
