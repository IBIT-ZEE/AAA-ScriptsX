:ENTRY
	CALL IBIT_LOG %0 %*
	::if "%1"=="" goto CATCH1


:INITIALIZE


:BEGIN


:MAIN
	start "SANTACASA$" SANTACASA$.lnk
	start "SANTACASA$" "C:\dat\Excel\Santacasa Jogos by ZEE.xls"
	start "SANTACASA$" "https://www.jogossantacasa.pt"
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