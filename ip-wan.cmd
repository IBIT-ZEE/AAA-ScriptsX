call AAA-Log %0 %*


:MAIN
	if "%1"=="-?" ( AAA-Obs %0 )
	
	curl icanhazip.com

	exit /b


:OBS


	* public IP

	// CURL
	curl icanhazip.com
	curl ifconfig.co
	curl ifconfig.me
	curl ipecho.net/plain
	curl http://wooledge.org/myip.cgi
	
	
	// WGET
	wget -qO- http://ipecho.net/plain


	// WSL
	wsl.exe dig +short myip.opendns.com @resolver1.opendns.com  


	// BROWSER
	canyouseeme.org
	checkip.org
	omeuip.pt
