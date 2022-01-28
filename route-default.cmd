AAA-Obs %0


:OBS
	******************
	Add default routes
	******************

	ATT*** if nameservice is need use also DNS-...

	================
	on routing-table
	----------------
	route-delete ...
	route-add    ...


	======
	on NIC
	------
	netsh interface ipv4 set address 'LAN1' static 10.0.1.108 255.0.0.0 none


	*********************
	Remove default routes
	*********************

	================
	on routing-table
	----------------
	route delete -p 0.0.0.0


	======
	on NIC
	------
	netsh interface ipv4 set address "LAN1" static 10.0.1.108 255.0.0.0 none



