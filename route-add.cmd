AAA-Obs %0



:OBS
	Add new routes...

	use route.cmd/fork to preview pre-configured routing scripts
	like route1, route2, ... if available
	

	~ route add [-p] 192.168.168.0 mask 255.255.255.0 192.168.1.1

	~ route add 0.0.0.0 mask 0.0.0.0 10.0.0.254 metric 10 if ?37

	~ route add 0.0.0.0 mask 0.0.0.0 10.0.0.254 if ?37	*LAN0/Proxy0
	~ route add 0.0.0.0 mask 0.0.0.0 10.0.1.254 if ?36	*LAN1/router1
	~ route add 0.0.0.0 mask 0.0.0.0 10.0.2.254 if ?16	*LAN2/Proxy2


