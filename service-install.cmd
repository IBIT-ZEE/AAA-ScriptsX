AAA-Obs %0



:OBS

	Install a service

	~ sc create sshd ^
		start= delayed-auto ^
		binpath= c:\apl\!TOOLS\_NETWORK\_REMOTE\OpenSSH64\sshd.exe ^
		displayname= OpenSSH 

	~ New-Service 
		-name sshd `
		-path c:\apl\!TOOLS\_NETWORK\_REMOTE\OpenSSH64\sshd.exe `
		displayname OpenSSH ´
		-starttype automatic


