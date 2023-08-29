call AAA-Log %0 %*

:MAIN
	if "%1"=="" ( AAA-Obs %0 )
	exit /b


:OBS
>nmap-

	nmap -p 443 <ip>/<subb>
	nmap -p 445 <ip>/<subb>
	
	nmap -p 443 10.0.0.0/24
	nmap -p 443 10.0.0.1/24
	
	nmap -p 445 192.168.1./<bits>

	nmap --script smb-enum-shares.nse -p445 <host>
	sudo nmap -sU -sS --script smb-enum-shares.nse -p U:137,T:139 <host>

