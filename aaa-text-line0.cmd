@echo off

if "%~1"=="" (
	AAA-Message ^
		"aaa-text-line0 <file>"^
		"" ^
		"Get 1st line of file"
	)

@echo on
for /F %%f in ( '%~1' ) do (
	echo %%f
	exit /b
	)
	
