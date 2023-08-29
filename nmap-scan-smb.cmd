call AAA-Log %0 %*

:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>nmap-
>nmap-smb

	nmap -p137,445 <ip>/<octs>
	
	nmap -p137,445 10.0.0.0/8
	nmap -p137,445 192.168.1.0/24

	nmap --script smb-enum-shares.nse -p445 <host>
	sudo nmap -sU -sS --script smb-enum-shares.nse -p U:137,T:139 <host>
