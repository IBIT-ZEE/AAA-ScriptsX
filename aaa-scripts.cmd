:: @if "%~1"=="/?" ( AAA-Message "try:" "" "AAA-List <wildcard-mix>" )
@if "%~1"=="/?" AAA-Obs %0

@Call AAA-Log %0 %*
setlocal
set VK_TAB=	

:: BREAK if no AAA-* vars
Call AAA-Env-Check

for %%a in ( %AAA-Execs% ) do ( 
	if exist *.%%a (
		echo [%%a/%1*] ^ 
		for %%b in ( %1*.%%a ) do ( 
			echo %%~tb ^| %%~ab ^| %%~zb%VK_TAB% ^| %%~nb	
			)
		echo,
		)
	)

endlocal
exit /b

:: (for %f in (*) do ((if not "%~xf"=="" echo,%~xf) | awk '!x[toupper($0)]++')


:OBS
Scripts digest
get executable extensions from AAA-Execs

	try: AAA-List <name/wildcards>"


ATT***
to generalize in AAA-Files.?cmd/?ps1/?py <name/wildcards>
to refactor a AAA-Env %x% ???is AAA-* ready

