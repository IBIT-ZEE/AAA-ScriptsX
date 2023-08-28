
:MAIN
	AAA-Obs %0
	exit /b

:OBS
>HyperV-
>QEmu-

Virtualbox-*

	2REFACTOR***

	*-! _____________ VirtualBox home folder (Explorer)
	*-!! ____________ VirtualBox data folder (Explorer)
	*-!!! ___________ VirtualBox home folder (Console)
	*-USBVMDK _______ Create a VMDK pointing to a USB drive
	*-NEWDISKID _____ Regenerate disk ID (UUID)
	*-TOFIXED _______ Convert dynamic to fixed
	*-TOIMMUTABLE ___
	*-RESIZE ________

	Samples:
	>VBoxManage internalcommands sethduuid disk2.vdi
	>VBoxManage internalcommands createrawvmdk -filename "xxx.vmdk"-rawdisk \\.\physicaldriveX
