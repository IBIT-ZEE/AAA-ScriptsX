@Call AAA-Log %0 %*


:INIT
	:: if not defined aaa-baks AAA-Message "AAA-BAKS is not in environment..."
	if not defined AAA-Baks ( 
		call AAA-
		set AAA-BAKS=C:\XXX\!!!!BAKS
		)
	
	call aaa-date
	echo,
	echo,


:MAIN
	echo ^|	Backup/7z C:\DAT 
	echo ^|
	echo ^|		-to- %AAA-BAKS%
	echo ^|		-to- DAT_%aaa-datetime%.7z
	echo ^|

	choice /m "|>		0=Exit -or- 1=Continue..." /c 10

	if ErrorLevel 2 Exit /b
	
	echo,
	echo,
	:: PRESERVE PREVIOUS BACKUP
	:: if exist %AAA-BAKS%\DAT.7z (
	:: 	del %AAA-BAKS%\DAT.7z.~
	::	ren %AAA-BAKS%\DAT.7z *.7z.~ 
	::	)

	:: check if the command is available (OR EXIT)
	:: if availble then archive
	Call File-Check 7z.cmd
	Call 7z.cmd a "%AAA-BAKS%\DAT_%aaa-datetime%.7z" c:\dat

	goto :END


:END
	echo,
	echo,


