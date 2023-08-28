AAA-Obs %0



:Obs

	Importar uma instancia WSL em formato POSIX/TAR
	(resultado de uma anterior exportação)

	~ wsl.exe --import <name> <destination-folder> <file.tar.gz>
	~ wsl.exe --import Kali "C:\SYS\Kali" "C:\XXX\WSL\aaa-kali.tar.gz"

	~ wsl.exe ^
		--import docker-desktop ^
		"C:\XXX\{vm}\WSL\Docker-Desktop" ^
		"C:\XXX\WSL\docker-desktop.tar.gz"

	~ wsl.exe ^
		--import docker-desktop-data ^
		"C:\XXX\{vm}\WSL\Docker-Desktop-Data" ^
		"C:\XXX\WSL\docker-desktop-data.tar.gz"

~ wsl.exe --import docker-desktop "C:\XXX\{vm}\WSL\Docker-Desktop" "C:\XXX\WSL\docker-desktop.tar.gz"

~ wsl.exe --import docker-desktop-data "C:\XXX\{vm}\WSL\Docker-Desktop-Data"  "C:\XXX\WSL\docker-desktop-data.tar.gz"



