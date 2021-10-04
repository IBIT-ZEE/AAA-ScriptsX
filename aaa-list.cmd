@if "%~1"=="/?" ( AAA-Message "try:" "" "AAA-List <wildcard-mix>" )
@Call AAA-Log %0 %*

setlocal
set VK_TAB=	

:: UNIQUE EXTENSIONS *do not work/unfold variable
:: test AAA-*


if NOT defined aaa-env ( AAA-Message "AAA-Environment variables not set..." )

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