
:MAIN
	@echo off
	Call AAA-Obs %0

	echo --------------------
	echo IBIT Azure/Softether
	ping -n 1 ibit.azure.net
	ping -n 1 ibit.softether.net

	echo,
	echo,
	echo --------------------
	echo IBIT Azure/Softether
	ping -n 1 ibit-work.azure.net
	ping -n 1 ibit-work.softether.net

	echo,
	echo,
	echo -------------
	echo IBIT DYNU.net
	ping -n 1 ibit.dynu.net
	
	exit /b


:OBS

	DDNS current by IBIT


