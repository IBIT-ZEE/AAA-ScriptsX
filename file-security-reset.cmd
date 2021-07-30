
if "%~1"=="" (
	AAA-Message ^
		"Syntax:" ^
		"" ^
		"File-Security-Reset <path+wildcard>" ^
		"" ^
		"Cleanup of file security rights" ^
		"in current folder and subfolders" ^
		"file filter wildcards accepted..." ^
		""
	)

icacls.exe %1 /reset /t /c /l

