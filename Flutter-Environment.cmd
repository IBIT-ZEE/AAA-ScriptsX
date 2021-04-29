Call AAA-Log %0 %*


set DART=C:\Apl\Google\Dart
set FLUTTER=C:\Apl\Google\Flutter
set ANDROID_SDK_ROOT=C:\Apl\Google\Android\SDK

set PATH=%path%;%DART%\bin;%FLUTTER%\bin;c:\apl\Microsoft\PowerShell64

CD /d C:\Dat\Flutter
echo Folder  = %CD%
echo PATH    = %PATH%
echo,

echo Dart        = %DART%
echo Flutter     = %FLUTTER%
echo Android-SDK = %ANDROID_SDK_ROOT%
echo,
echo,

flutter devices
