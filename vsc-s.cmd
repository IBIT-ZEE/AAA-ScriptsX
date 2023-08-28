
:MAIN
	@echo off
	
	:: must be at filesystem location for file matching
	pushd c:\dat\#scripts
	start /b "%date% ~ %time%" C:\APL\Microsoft\Code64\Code.exe .
	
	:: unfold extra arguments
	:: then unfold the matching scripts
	for %%a in ( %* ) do ( 
		for %%b in ( %%a* ) do ( 
			echo Also opening %%b...
			start /b C:\APL\Microsoft\Code64\Code.exe %%b
			)
		)
		
	popd


:END
	echo,
	echo,

