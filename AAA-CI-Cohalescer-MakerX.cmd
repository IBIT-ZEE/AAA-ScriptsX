@echo off
cls
echo //// ZEE                       /     __  ______   __  ______
echo /// 2016                      //    / / / /_/ /  / / /  ___/
echo // AAA-Sys-Boot-MakerX GUID  ///   / / / /--/ / / / / /
echo /___ phase 2/2              ////  /_/ /_/__/_/ /_/ /_/
echo.
echo.

if not exist %systemdrive%\SYS\BOOT ( echo Not a AAA Boot drive... & exit /b )
if "%1"=="" ( echo no GUID supplied... & exit /b )
set aavGUID=%1

:: show parameters and ask for * to continue execution

:: show parameters and ask for * to continue execution
echo Parameters should be filled from the last operation...
echo the 1st phase should have been AAA-Sys-BootMaker...
echo.
echo Drive ____ %aavDrive%
echo Folder ___ %aavFolder%
echo File _____ %aavFile%
echo GUID _____ %aavGUID%
echo.
echo.
set /p aavTemp="Digitar '*' (asterisco) para executar... "
if NOT "%aavTemp%"=="*" exit /b
echo.
echo.

if NOT "%aavTemp%"=="*" exit /b

:: Windows7.vhd
bcdedit.exe /store %aavFile% /set %aavGUID% device vhd=[locate]\sys\Windows7.vhd
bcdedit.exe /store %aavFile% /set %aavGUID% path \Windows\system32\winload.exe
bcdedit.exe /store %aavFile% /set %aavGUID% osdevice vhd=[locate]\sys\Windows7.vhd
bcdedit.exe /store %aavFile% /set %aavGUID% systemroot \Windows
bcdedit.exe /store %aavFile% /set %aavGUID% description "Windows 7 (*)"
bcdedit.exe /store %aavFile% /displayorder %aavGUID% /addfirst

bcdedit /default %aavGUID%


:: Windows7-bak.vhd
:: WindowsX(go).vhd
:: GUB4DOS entry


echo.
echo.
