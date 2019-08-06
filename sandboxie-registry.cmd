Call IBIT_Log

echo Hive will be in HKLM -^> XXX
echo.
echo.
Timeout 10

reg.exe load "HKLM\XXX" "C:\XXX\Sandbox\ZEE-PC\DefaultBox\RegHive"
start c:\sys\regedit.exe


