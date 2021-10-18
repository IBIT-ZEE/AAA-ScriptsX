###############################################################################
#
# Route-Changer
#
#

<#
AAA routing hacks
Clean routing table and redefine a Gateway
identifying INTERFACE/ID from MAC-Address
Need also the L3/IP/NIC and the L3/IP/Gateway

USED BY: route/route1/...

Powershell choosen for more efficacy
on obtaining Interface-Index from MAC-Address

route.exe -f
route.exe add 0.0.0.0 mask 0.0.0.0 10.0.1.254 if ?
route.exe add 10.0.0.0 mask 255.0.0.0       10.0.1.8
route.exe add 10.0.1.8 mask 255.255.255.255 10.0.1.8

Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0       10.0.1.254         10.0.1.8     26
         10.0.0.0        255.0.0.0         On-link          10.0.1.8     26
         10.0.1.8  255.255.255.255         On-link          10.0.1.8     26
   10.255.255.255  255.255.255.255         On-link          10.0.1.8    281

#>

Param( $xMac, $xIP, $xGW, $xName = "NIC/L3=$xIP/L2=$xMac" )

AAA-Logo

if ( [string]::IsNullOrEmpty( $args + $xMac + $xIP + $xGW ) )
	{
	AAA-Message "", "Route-Changer <MAC> <IP-Address> <IP-Gateway> <IF-Name>", ""
	Exit 1
	}

$xIF = ( Get-NetAdapter | Where-Object { $_.MacAddress -eq $xMac } ).ifIndex


$xArgs = `
	'-f', `
	( 'add 0.0.0.0 mask 0.0.0.0 ' + $xGW + ' if ' + $xIF ), `
	( 'add 10.0.0.0 mask 255.0.0.0 ' + $xIP            ), `
	( 'add ' + $xIP + ' mask 255.255.255.255 ' + $xIP  ), `
	'print'

AAA-Alert `
	"Redefining route/gateway to...", `
	$xName, `
	"Interface: $xIF | Mac: $xMac | IP: $xIP", 
	"", 
	$xArgs[1],
	$xArgs[2],
	$xArgs[3]

# PROCESS ALL arguments for route-exe
Foreach( $x in $xArgs )
	{
	Write-Host "route.exe $x"

	Start-Process `
		-FilePath 'route.exe' `
		-ArgumentList ( $x )

	}





