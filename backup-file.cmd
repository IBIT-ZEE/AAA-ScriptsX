Call IBITLogo

if "%1"=="" goto MSG_SYNTAX

set fname=
set ftime=

set fname=%1
if not "%2"=="" set fname=%2\%fname%
if not "%3"=="" set fname=%3%fname%
if "%4"=="/t" set ftime= %date%-%time%

if not exist %fname% goto MSG_NOFILE

:MAIN
	copy %fname% "\xxx\!!!!baks%2\%1 %ftime%"
goto END:


:MSG_SYNTAX
	echo Backup file to ^<!!!!BAKS^>/path/file 
	echo with time instance option
	echo.
	echo.
	echo BakFile ^<file^> [^<\dir^> [^<drive^>] [/t]]]
goto END

:MSG_NOFILE
	echo %fname% não encontrado
goto END

:END
  echo.
  echo.