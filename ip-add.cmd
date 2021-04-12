AAA-LogX ^
	Call AAA-Message ^
		"~ netsh interface ip add address LAN0 192.168.0.8 255.255.255.0" ^
		"~ netsh interface ip add address LAN0 192.168.168.192 255.255.255.0" ^
		"~ netsh interface ip add address LAN0 169.254.0.8 255.255.0.0"
