setlocal

if "%~1"=="" (
	AAA-Message ^
		"aaa-test <file> <label>" ^
		"" ^
		"Get a chunk of text from file" ^
		"beginning at passed :LABEL" ^
		"up to next immediate label marker :"
	)

set aaaFlag=0

for /F %%f in ( "%~1" ) do (
	if "%%f"==":" set aavFlag=0 &
	if "%%f"=="%2" set aavFlag=1 &
	if "%aavFlag%"=="1" echo %f
	)
	
endlocal