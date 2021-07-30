Call IBIT-Log %0 %*

for /F %%f in ( 'wevtutil el' ) do @(
	wevtutil qe %%f /q:"*[System[TimeCreated[timediff(@SystemTime) <= 60000]]]" 2>nul
	if ERRORLEVEL 1 echo Failed to open : %%f
	)

echo,
echo  * Last minute events... 60s/60000 milliseconds
echo,
echo,