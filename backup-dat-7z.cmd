@Call AAA-Log %0 %*


:INIT
	if not defined aaa-baks AAA-Message "AAA-BAKS is not in environment..."
	echo,
	echo,

:MAIN
	echo ^|	Backup/7z C:\DAT -to- %AAA-BAKS%
	echo ^|
	echo ^|

	choice /m "|>		0=Exit -or- 1=Continue..." /c 10

	if ErrorLevel 2 Exit /b
	
	echo,
	echo,
	:: PRESERVE LAST BACKUP IF EXIST
	del %AAA-BAKS%\DAT.7z.~
	ren %AAA-BAKS%\DAT.7z *.7z.~ 

	c:\APL\!TOOLS\_APPLETS\7Zip64\7z.exe a %AAA-BAKS%\DAT" c:\dat

:END
	echo,
	echo,


