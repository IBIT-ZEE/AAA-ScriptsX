Call AAA-Log %0 %*
for /F %%f in ( 'wevtutil.exe el' ) do ( wevtutil cl %%f ) 

