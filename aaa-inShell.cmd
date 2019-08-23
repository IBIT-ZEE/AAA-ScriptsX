:: errorlevel
::	0 if starting from console
:: 	1 if starting from shell
echo %cmdcmdline% | %SystemRoot%\System32\find.exe "%comspec% /c" >nul
if ERRORLEVEL 1 exit /b 0
%SystemRoot%\System32\Timeout.exe 60
exit /b 1




