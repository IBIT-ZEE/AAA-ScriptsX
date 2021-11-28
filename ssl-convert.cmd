@AAA-Obs %0


:MAIN
	@???
	
	exit /b



:OBS
	2DO***
	
	~ ssl x509 -in x-certificate.crt -inform der
	~ ssl x509 -in x-certificate.crt -inform der -out x.pem
	
	~ ssl x509 -in x.pem -outform der
	




