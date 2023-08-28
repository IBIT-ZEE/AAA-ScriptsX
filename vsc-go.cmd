
:MAIN
	@echo off
	if "%~1"=="" AAA-Obs %0
	
	AAA-Obs %0
	
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


:OBS
2DO***

	Problem:
		shift %* to nullify %1 after consumed


ATT***

	This Fork/Leverage is intended to be used internally
	by the other code-<language> scripts


	Syntax:
		code-_go <repository> <file-to-unfold> ...


