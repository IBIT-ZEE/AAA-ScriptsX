@call AAA-Log %0 %*


:MAIN
	if "%~1"=="" Call AAA-Obs %*
	if not exist "%~1" AAA-Message "file '%~1' not found"
	
	::mode con: lines=16 cols=64
	::echo (c) ZEE 2014 (r) -^> FileInfo
	:: ?Owner
	:: ?Rights
	:: Opened by ???
	echo 	File information:
	echo,
	echo 	%~1 -is- %~f1
	echo,
	echo 		Size : %~z1
	echo 		Date : %~t1
	echo 		Attr : %~a1
	echo 		DOS8 : %~s1
	echo,
	echo 	* file fullname is in clipboard...
	echo "%~f1" | clip
	REM drive: %~d1
	REM pathDir: %~p1
	REM DOSName: %~s1
	
	goto END


:END
	echo,
	echo,
	endlocal
	exit /b


:OBS

	File Information...
