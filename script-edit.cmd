::Call AAA-Log %0 %*


:ENTRY
	@echo off
	setlocal
	
	set xExts=cmd cs csh ps1 py perl vbs

	if "%1"=="" ( 
		AAA-Message ^
			"Use:" ^
			"" ^
			"CodeX <script>" ^
			"" ^
			"Edit code from scripts in AAA-Ecosystem..." ^
			"Code is aware of : .%xExts: =|.%"

		)
	

	:: QUIRK*** if not defined was failling... 
	:: so... test for defined as it works
	:: if not defined AAA-Env AAA-Message "AAA-Vars missing, need AAA-Env..." 
	if defined AAA- goto :MAIN

	AAA-Message "AAA-Vars missing, need AAA-Env..."
	
	goto :END


:MAIN

	for %%f in ( %AAA-#% %AAA-Scripts% %AAA-ScriptsX% %AAA-ScriptsXX% ) do (
		:: ?EXACT FILENAME !EXIT -aka- extension was supplied...
		if exist %%f\%1 ( set x=%%f\%1 && goto :GO )

		:: ?AMBIGUITY RESOLVER -aka- we'll 'guesstimate' the extension...
		for %%g in ( %xExts% ) do (
			if exist %%f\%1.%%g (  set x=%%f\%1.%%g && goto :GO )
			)
		)

	AAA-Message ^
		"" ^
		"Not found any script named :  %~1" ^
		"" ^
		"with any of the extensions : .%xExts: =/.%"

	goto :END


:GO
	:: ?use codeX.cmd for edit in default text-editor
	:: ?or a AAA-* variavble/switch in AAA-*/Context
	:: C:\APL\!TOOLS\_APPLETS\Notepad++64\notepad++.exe %1
	
	:: Call AAA-Message %x% 
	start /b "%x%" C:\APL\!TOOLS\AAA\binxx\Notepad++64\notepad++.exe %x%
	goto :END


:END
	endlocal
	echo,
	echo,


