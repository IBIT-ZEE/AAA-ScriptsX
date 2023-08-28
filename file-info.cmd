@call AAA-Log %0 %*


:BEGIN
	if "%~1"=="" ( Call AAA-Obs %* )
	if exist "%~1" goto :MAIN
	
	:: Exist in %PATH% ???
	for %%f in ( "%~1" ) do ( 
		if NOT "%%~$PATH:f"=="" ( %0 "%%~$PATH:f" ) 
		)

	AAA-Message "file '%~1' not found..."
	goto :END


:MAIN
	::mode con: lines=16 cols=64
	::echo (c) ZEE 2014 (r) -^> FileInfo
	:: ?Owner
	:: ?Rights
	:: Opened by ???
	echo 	File information:
	echo,
	echo 	%~f1
	echo,
	echo 		Size : %~z1
	echo 		Date : %~t1
	echo 		Attr : %~a1
	echo 		DOS8 : %~s1
	echo,
	c:\apl\Cygwin64\bin\file.exe %*
	echo,
	echo * file fullpath sent to clipboard...
	
	goto END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS
>file
>file-infoX

	File Information...

	2DO***
		?is a folder



