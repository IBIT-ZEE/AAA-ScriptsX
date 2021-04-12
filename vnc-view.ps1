<#
.SYNOPSIS

Manager for TightVNC/tvnserver.exe

.NOTES


#>

Param( $xHost='.', $xPort=5900, $xUser="OEM" )


AAA-Log


# INFORMATION
"AAA/VNC {0}:{1} as {2}" -f $xHost, $xPort, $xUser


# ?NOT A VALID HOST??
if ( $xHost -eq "." ) 
	{ 
	AAA-Alert `
		"", `
		"VNC-View-*", `
		"to buil static parameterized commands", ` 
		"-like-", ` 
		"VNC-View-<host/port/user>", `
		"-or-", `
		"dynamic parameterized statements", ` 
		"-like-", ` 
		"VNC-View <host> <user!OEM> <port!5900>", `
		"";

	return 1; 
	}


Start-Process `
	-FilePath 'C:\APL\!TOOLS\_network\_REMOTE\RealVNC5\vncviewer.exe' `
	-ArgumentList ( "-scaling aspectFit -username={0} {1}:{2}" -f $xUser, $xHost, $xPort )




