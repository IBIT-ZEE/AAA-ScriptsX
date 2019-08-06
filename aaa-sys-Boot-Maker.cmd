@echo off
cls
echo //// ZEE                    /     __  ______   __  ______
echo /// 2016                   //    / / / /_/ /  / / /  ___/
echo // AAA-Sys-Boot-Maker x:  ///   / / / /--/ / / / / /
echo /___ phase 1/2           ////  /_/ /_/__/_/ /_/ /_/
echo.
echo.
set aavDrive=%1
set aavFolder=%aavDrive%\boot
set aavFile=%aavFolder%\BCD
set aavGUID=null (will generate new)

if "%~1"=="" (
	echo 	SYNTAX: AAA-Sys-Boot-Maker ^<drive^>
	echo.
	echo.
	exit /b 
	)

if not exist %systemdrive%\SYS\BOOT (
	echo 	ATT***
	echo 	This is not a AAA Boot drive... 
	echo 	No ^<boot^>\SYS for file copy
	echo.
	echo.
	exit /b 
	)
	
if "%1"=="" ( echo no drive specified... & exit /b )

:: show parameters and ask for * to continue execution
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

:: AAA transfer of windows and GRUB bootable files
for %%f in (APL DAT SYS XXX) do md %aavDrive%\%%f
for %%f in (!!!!LOGS !!!!BAKS !!!!TEMP !!!!TEST) do md %aavDrive%\XXX\%%f
md %aavFolder%
xcopy /b/v/h/r/i/y %systemdrive%\SYS\boot   %aavDrive%\boot
xcopy /b/v/h/r/i   %aavDrive%\boot\BOOTMGR  %aavDrive%\
xcopy /b/v/h/r/i   %aavDrive%\boot\grldr*.* %aavDrive%\
xcopy /b/v/h/r/i   %aavDrive%\boot\menu.lst %aavDrive%\

:: Create boot store and default entry
bootsect /nt60 %aavDrive% /mbr
bcdedit /createstore %aavFile%
bcdedit /store %aavFile% /timeout 1

bcdedit /store %aavFile% /create {bootmgr}
bcdedit /store %aavFile% /set {bootmgr} description "AAA Boot/BootMgr"
bcdedit /store %aavFile% /set {bootmgr} device boot
:: bcdedit /store %aavFile% /set {bootmgr}

bcdedit /store %aavFile% /create /application osloader
echo.
echo.
echo ************************************************************
echo AAA-Boot-MakerX GUID (use above GUID to complete last phase)
echo GUID must retain the {} delimiters
echo ************************************************************
echo.
echo.


