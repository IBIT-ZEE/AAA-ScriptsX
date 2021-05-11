@if "%~1"=="" %0 .
@net stop w3svc
@c:\apl\php64\php.exe -S localhost:80 -t %*
