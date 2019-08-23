@echo off 
cls
echo    //\\==================================================================//\\
echo   //          /\                                                            \\
echo  //          /__\     ----====::::[[[[ IBIT ArteWare ]]]]::::====----        \\
echo  \\         /\[]/\    ----====::::[[[[ (c) ZEE 2016  ]]]]::::====----        //
echo   \\       /__\/__\                                                         // 
echo    \\//==================================================================\\//
echo.
echo.
echo %date% ~ %time% ~ %errorlevel% ~ %cd% >> c:\xxx\!!!!logs\system-log.txt
echo %* >> c:\xxx\!!!!logs\system-log.txt
echo. >> c:\xxx\!!!!logs\system-log.txt
