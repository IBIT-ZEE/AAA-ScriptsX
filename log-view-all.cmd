Call AAA-Log %0 %*
for /F %%f in ( 'wevtutil.exe el' ) do ( wevtutil qe %%f /f:text)

