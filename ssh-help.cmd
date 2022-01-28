AAA-Obs %0



:OBS


	// Start/Stop
	~ net start sshd
	~ net stop  sshd
	
	~ Start-Service -name sshd
	~ Stop-Service  -name sshd


	// Install
	~ sc create sshd ^
		start= delayed-auto ^
		binpath= c:\apl\!TOOLS\_NETWORK\_REMOTE\OpenSSH64\sshd.exe ^
		displayname= OpenSSH 

	~ New-Service 
		-name sshd `
		-path c:\apl\!TOOLS\_NETWORK\_REMOTE\OpenSSH64\sshd.exe `
		displayname OpenSSH ´
		-starttype automatic


