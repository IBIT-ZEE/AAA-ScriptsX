
Call AAA-Log %0 %*

if "%~1"=="" AAA-Message "Registry-Find <string>"


echo,
echo,
echo [ HKCR ]
reg.exe QUERY HKCR /s /v %1

echo,
echo,
echo [ HKLM ]
reg.exe QUERY HKLM /s /v %1

echo,
echo,
echo [ HKCU ]
reg.exe QUERY HKCU /s /v %1
