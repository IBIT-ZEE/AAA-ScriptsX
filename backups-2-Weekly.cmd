echo off
cls
echo prima uma tecla para iniciar a actualização
echo.
echo.

if "%1"=="" PAUSE
call bakdir \sage_l60$ \\server0 /t

if "%1"=="" PAUSE
call bakdir \{www} \\server0

if "%1"=="" PAUSE
call bakdir  \dat c: /t

