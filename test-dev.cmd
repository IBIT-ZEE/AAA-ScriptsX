@Call AAA-Log %0 %*

cd /d %USERPROFILE%
start /b "%date% ~ %time%" "C:\APL\Microsoft\Code64\Code.exe" .
Call PHP-Server.cmd .
:: @start "%date%-%time%" microsoft-edge:%%


