:ENTRY
	CALL IBIT_LOG %0 %*

	
:INITIALIZE
	:: set aavErrorlevel=255

:BEGIN


:MAIN
	:: <COMMANDS>
	echo Current path:
	echo %path%
	echo.
	echo.
	
	set path=c:\windows
	set path=%path%;c:\windows\system32
	set path=%path%;c:\windows\system32\wbem
	set path=%path%;c:\dat\#links;
	set path=%path%;c:\dat\#linksX;
	set path=%path%;c:\dat\#scripts;
	set path=%path%;c:\dat\#scriptsX;
	set path=%path%;c:\apl\Cygwin64\bin
	echo New path:
	echo %path%
	echo.
	echo.
	
	if ERRORLEVEL 1 goto :CATCH0
	goto END

	
:CATCH0
	:: catch no GREP or other command error
	grep -Poz "^:TEXT0\K[\w\W]*?(?=:)" %~f0
	echo ERRORLEVEL%errorlevel% ~ %date% * %time% ~ %cd%
	Timeout 60
	goto END


:CATCH1
	:: help syntax/*comments/etc.
	grep -Poz "^:TEXT1\K[\w\W]*?(?=:)" %~f0
	Timeout 60
	goto END

:CATCH2
	:: exception setting ERRORLEVEL 255-to-0
	grep -Poz "^:TEXT3\K[\w\W]*?(?=:)" %~f0
	:: return errorlevel1=file-not-in-path
	set aavErrorlevel=255
	goto END


:END
	echo. 
	echo.


:FINALIZE

	
:EXIT
	exit /b


:TEXT0
An error has occured

:TEXT1
SYNTAX

	???
	!!!

: