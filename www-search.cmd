call AAA-Log %0 %*
if "%~1"=="" goto :CATCH1
setlocal

:: C:\APL\Mozilla\Firefox64\firefox.exe -profile D:\{HDX}\XXX\Firefox\ZEE
:: C:\APL\Google\Chrome\Application\chrome.exe --user-data-dir=D:\{HDX}\XXX\Chrome\zee https://pinkreef.pt:2087/
:: "C:\Program Files\internet explorer\iexplore.exe" C:\DAT\AAA\AAA.html

:MAIN
	Call aaa-main %~f0
	set aavTemp=
	call :JOIN %*
	:: %aavTemp% can be refined by using goole + %20 etc.
	
	www-google %aavTemp%
	goto :END

:JOIN
	set aavTemp=%aavtemp% %~nx1
	shift
	if NOT "%~1"=="" goto :JOIN
	set aavTemp=%aavtemp:~1%
	goto :EXIT

:CATCH1
	aaa-main %~f0
	goto :END

:END
	echo,
	echo,

	endlocal
	exit /b


:OBS
WWW-Search

	Search the ´dropped´ parameters on pre-defined search engine

: