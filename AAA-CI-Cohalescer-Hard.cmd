call AAA-Log %0 %*  


:MAIN
	if "%1"==""           ( AAA-Obs %0 ) 
	if /i not "%1"=="-go" ( AAA-Obs %0 ) 

	:: REMOVE Symbolic Links at C:\
	:: rd will only delete the symlynk pointer
	for %%f in (APL DAT SYS XXX) do rd c:\%%f

	:: GENERATE Symbolic links at K:\
	:: AAA Tree (APL|DAT|SYS|XXX)
	echo,
	echo,
	for %%f in (APL DAT SYS XXX) do MkLink /d C:\%%f K:\%%f  


:END
	echo,
	echo,
	exit /b
	

:OBS
	AAA Cohalescence 

		AAA-Tree to K:\

	ATT***
	Dangerous...

	-go to force...


