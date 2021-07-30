
Call AAA-Log %0 %*

if "%~1"=="" AAA-Message ^
	"Registry-Find <string>" ^
	"" ^
	"Search..."


:: [ HKLM | HKCU | HKCR | HKU | HKCC ]

for %%f in ( HKLM HKCU HKCR HKU HKCC ) do (
	echo [%%f]
	reg.exe QUERY %%f /s /f %1
	echo,
	echo,
	)


echo,
echo,



