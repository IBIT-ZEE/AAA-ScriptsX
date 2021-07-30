
Call AAA-Log %0 %*

if "%~1"=="" AAA-Message ^
	"Registry-View <key>" ^
	"" ^
	"ATT <hive>\..."

echo,
echo,
echo [%1]
reg.exe QUERY %1 /s

