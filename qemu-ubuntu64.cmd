@start /b "QEmu-Ubuntu64" ^
	C:\APL\QEmu64\qemu-system-i386.exe ^
		-smp cores=2 ^
		-m 2048 ^
		-accel whpx
		"d:\{vm}\Ubuntu64.vhdx"



