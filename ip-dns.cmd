@AAA-Obs %0


:OBS
IP-DNS (will CLIP)

	* DNS static, Primary DNS server as well as a secondary one

	ipconfig /displaydns
	
	// DNS -> will show DNS in use
	netsh interface ip show dns	
	netsh interface ip set dns name="LAN1" dhcp
	netsh interface ip set dns name="LAN1" static 192.168.0.250
	netsh interface ip set dns name="LAN1" static 8.8.8.8 index=2

:
