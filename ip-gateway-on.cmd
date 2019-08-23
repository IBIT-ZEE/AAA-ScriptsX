:: Set a IP default gateway on a NIC

aaa-message^
	"route delete 0.0.0.0"^
	"route add 0.0.0.0 mask 0.0.0.0 10.0.0.254 metric 10 if 1"^
	""^
	"~or~"^
	""^
	"netsh interface ipv4 set address 'LAN1' static 10.0.1.108 255.0.0.0 none"