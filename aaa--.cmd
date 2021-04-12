Call aaa-log %0 %1

if not defined aaa-scriptsX ( 
	AAA-Message "AAA-Scripts variable not defined..." ^
	&& set aaa-
	)

setlocal
set x=%~n0
dir /b %aaa-scriptsX%\%x:~,-1%*-.*
endlocal
