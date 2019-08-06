:ENTRY
	mode con lines=16 cols=80
	CALL IBIT_LOG %0 %*
	::if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	start C:\APL\!TOOLS\_APPLETS\UltraEdit23\uedit64.exe "C:\DAT\{PINKREEF}\$KB\((((PINKREEF-X)))).$kb"
	Timeout 4
	start C:\APL\!TOOLS\_APPLETS\UltraEdit23\uedit64.exe "C:\DAT\{PINKREEF}\$KB\((((PINKREEF-Y)))).$kb"
	Timeout 2
	start C:\APL\!TOOLS\_APPLETS\UltraEdit23\uedit64.exe "C:\DAT\{PINKREEF}\$KB\((((PINKREEF-Z)))).$kb"
	Timeout 1

	:: start /b "" pinkreefX$.lnk	& timeout 4
	:: start /b "" pinkreefY$.lnk	& timeout 2
	:: start /b "" pinkreefZ$.lnk	& timeout 1
	if ERRORLEVEL 1 goto :CATCH2
	goto END

	
:CATCH1
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	goto END


:CATCH2
	echo.
	echo.
	echo ERRORLEVEL : %errorlevel%
	echo FOLDER     : %cd%
	grep -Poz "^:TEXT2\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT1
SYNTAX

	! <full-commandline-&-separated>


:TEXT2
CATCH#

	ERRORLEVEL was > 0

: