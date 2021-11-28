@AAA-Obs %0


:MAIN
	@ssl.cmd rsa -in x-private.key -pubout -outform PEM
	
	exit /b



:OBS
	2DO***
	?Recode...
	?decide about private key parameter in file ?
	
	~ ssl.cmd rsa -in x-private.key -pubout -outform PEM
	
