AAA-Obs %0



:Obs
	


	%USERPROFILE%
		\AppData\Local\Docker
		\AppData\Local\Docker\wsl
		
		\AppData\Roaming\Docker
		\AppData\Roaming\Docker Desktop

	docker-desktop      ~> .\AppData\Local\Docker\wsl\distro\ext4.vhdx
	docker-desktop-data ~> .\AppData\Local\Docker\wsl\data\ext4.vhdx
	
	Relocation
	XXX\Docker\docker-desktop.vhdx      ~> .\Local\Docker\wsl\distro\ext4.vhdx
	XXX\Docker\docker-desktop-data.vhdx ~> .\Local\Docker\wsl\data\ext4.vhdx
	AAA ~> Docker!!/{vm/wsl}
	
