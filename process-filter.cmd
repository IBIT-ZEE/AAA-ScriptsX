@if "%1"=="" %0 .
@tasklist.exe | grep -i %*
