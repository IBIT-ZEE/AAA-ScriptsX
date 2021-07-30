
Call AAA-Log %0 %*

if "%~1"=="" AAA-Message "Syntax: AAA-Edit <datafile>"
if NOT DEFINED aaa-data AAA-Message "AAA ecosystem not defined..."
if NOT EXIST %aaa-data%\%1.dat AAA-Message "O ficheiro %1 nao existe..."

cat %aaa-data%\%1.dat
