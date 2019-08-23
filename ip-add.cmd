AAA-LogX ^
	Call AAA-Message ^
		"~ netsh interface ip add address 'LAN1' 192.168.168.192 255.255.255.0" ^
		"~ netsh interface ip add address 'LAN1' 169.254.1.8 255.255.0.0"
