AAA-Obs %0



:OBS

	QEmu AAA resumeé:
	C:\APL\QEmu64\*

	//
	qemu-system-i386.exe ^
		-accel whpx ^
		-m 4096 ^
		-smp cores=4 ^
		-hda D:\{vm}\Hyper-V\x.vhdx

	~ qemu-system-i386 -accel whpx -m 4096 -smp cores=4 -hda \\.\PHYSICALDRIVE5

	//
	C:\APL\QEmu64\qemu-system-x86_64.exe

	// DISKS
	-hda \\.\PHYSICALDRIVE5
	-hda C:\SYS\xxx.vhdx
	-hda D:\{vm}\VirtualBox\AAA-Appliances\WS32UX\WSX32.vhd
	-hda D:\{vm}\x.vhdx
		AAA.vhdx
		DockerDesktop.vhdx
		Kali32.vhdx
		Kali64.vhdx
		Proxy1.vhdx
		Ubuntu32.vhdx
		Ubuntu64.vhdx
		WIM32.vhdx
		WIM64.vhdx
		Windows2019-CI.vhdx
		WindowsX32-CI.vhdx
		WindowsX64-CI.vhdx
		WindowsXP.vhdx
		xx.vhdx
		xxx.vhdx
		x~empty~16GB.vhdx
		_efi-1-storage.vhdx
		_testXX-Windows10x32.vhdx

	// EMULATIONS
	i386 i386w
	x86_64 x86_64w
	+
	aarch64 aarch64w alpha alphaw arm armw avr avrw
	cris crisw 
	hppa hppaw 
	m68k m68kw
	microblaze microblazeel microblazeelw microblazew
	mips mips64 mips64el mips64elw mips64w mipsel mipselw mipsw
	moxie moxiew
	nios2 nios2w
	or1k or1kw
	ppc ppc64 ppc64w ppcw
	riscv32 riscv32w riscv64 riscv64w
	rx rxw 
	s390x s390xw
	sh4 sh4eb sh4ebw sh4w
	sparc sparc64 sparc64w sparcw
	tricore tricorew
	xtensa xtensaeb xtensaebw xtensaw

	// UTILS
	qemu-edid qemu-ga qemu-img qemu-io qemu-nbd
