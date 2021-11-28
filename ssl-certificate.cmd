@AAA-Obs %0


:MAIN
	@ssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048  -keyout x-private.key
	
	exit /b



:OBS
	2DO***
	?Recode...
	?private key file input parameter??
	
	~ ssl.cmd req -x509 -sha256 -nodes -days 365 
	~ ssl.cmd req -x509 -sha256 -nodes -days 365 -key x-private.key
	~ ssl.cmd req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privkey.pem
	
	~ ssl.cmd req -x509 -newkey rsa:1024 -days 365
	~ ssl.cmd req -x509 -newkey rsa:1024 -days 365 -keyout con -out con
