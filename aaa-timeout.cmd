@echo off
setlocal
if "%~1"=="/?" ( AAA-Message "Use:" "" "AAA-Timeout [<seconds>/default=10"] )
if "%~1"==""   ( set x=10 ) else ( set x=%1 )
set /a x+=0
start "Timeout %x%" cmd /c "color A0 & mode con lines=8 cols=32 & timeout.exe %x%"
endlocal

