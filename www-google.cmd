:ENTRY
	call IBIT_LOG %0 %*
	if "%~1"=="" goto :CATCH1
	setlocal

:INITIALIZE
	set aavTemp=

:BEGIN


:MAIN
	:: C:\APL\Mozilla\Firefox64\firefox.exe -profile D:\{HDX}\XXX\Firefox\ZEE
	:: C:\APL\Google\Chrome\Application\chrome.exe --user-data-dir=D:\{HDX}\XXX\Chrome\zee https://pinkreef.pt:2087/
	:: "C:\Program Files\internet explorer\iexplore.exe" C:\DAT\AAA\AAA.html

	C:\APL\Google\Chrome\Application\chrome.exe --user-data-dir=D:\{HDX}\XXX\Chrome\zee http://google.com/search?q="%*"
	:: C:\apl\Google\Chrome64\Application\chrome.exe http://google.com/search?q="%*"
	goto :END

:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=^:)" %~f0
	goto :END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	endlocal
	exit /b


:TEXT1
WWW-Google

	Search the passed parameters on google engine

: