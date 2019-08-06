aaa-mainX.cmd %~n0


:OBS
	System-Terminate-*

	Terminate/Kill a process by name
	Kill.cmd as alias for terminating by name


	*-Name ______ Terminate by process name (wildcard * allowed)
	*-Process ___ Terminate by Procedd ID (PID)
	*-User ______ Terminate all processes from the specified user
	*-Window ____ Terminate by GUI name/handle


	*-Hogs ___________ Terminate CPU Hogs processes (threshold/90%)
	*-Unresponsive ___ Terminate unresponsive processes
: