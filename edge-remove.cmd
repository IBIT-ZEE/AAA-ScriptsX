call AAA-Log %0 %*


:MAIN
	if "%1"=="" ( AAA-Obs %0 ) 
	exit /b


:OBS
[RECIPE]

	process-kill.cmd edge
	
	folder-remove
		C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe
		C:\Program Files (x86)\Microsoft\Edge
		C:\Program Files (x86)\Microsoft\EdgeUpdate
		C:\Program Files (x86)\Microsoft\EdgeCore
		C:\Program Files (x86)\Microsoft\EdgeWebView

	
	shortcut-remove
	C:\Users\Public\Desktop\Microsoft Edge.lnk
	%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk
	%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk

	?edit registry key to prevent re-install by update
		[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate]
			DoNotUpdateToEdgeWithChromium=dword:00000001
		[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{9459C573-B17A-45AE-9F64-1857B5D58CEE}]

	regedit /s x.reg & del x.reg


