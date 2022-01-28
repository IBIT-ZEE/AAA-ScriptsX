AAA-Obs %0



:OBS
	>Service-Help
	
	// START/STOP
	~ net start sshd
	~ net stop  sshd
	
	~ Start-Service -name sshd
	~ Stop-Service  -name sshd


	// TUNNELS
	ssh -C oem@ibit.softether.net -p 12010 -R 3388:localhost:3389

	ssh -C oem@ibit.dynu.net -p 12010 -R 3388:localhost:3389
	ssh -C oem@ibit.dynu.net -p 12010 -R 5899:localhost:5900

	?ssh -J (jumps)
	?ssh ?? (proxy)



