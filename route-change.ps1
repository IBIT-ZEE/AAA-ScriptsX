<#
Route-Change

Add a new route
get the needed INTERFACE-INDEX from MAC-ADDRESS

used by ROUTE/ROUTE1/...

Powershell prefered for hability to obtain NIC data
mainly Interface-Index from MAC-Address

exit
	1. wrong argument count
	2. no NIC/MAC found
#>


Clear
AAA-Logo

if ( $args.Count -ne 2 )
	{
@"

	Syntax:
	
		Route-Change <MAC> <IP>
	
	* MAC to find the NIC
	* IP to assign as Gateway

"@
		
	Exit 1
	}

$xMac = $args[0]	# hold the MAC for search
$xIP  = $args[1]	# hold the IP  for gateway

# obtain the INTERFACE-INDEX for the MAC-ADDRESS
$xIF = ( Get-NetAdapter | Where-Object { $_.MacAddress -eq $xMac } )

if ( !$xIF ){ AAA-Alert "", "no NIC with MAC $xMAC found...", ""; exit 2 }

$xIPs = `
	( Get-NetIPAddress -InterfaceIndex $xIF.InterfaceIndex ).IPAddress -join ", "

@"

Redefining route/gateway to...

	Interface #{0}/{1}:
	{2}/{3}
	{4} -over- {5}

"@ -f `
	$xIF.InterfaceIndex, `
	$xIF.MacAddress, `
	$xIF.InterfaceAlias, `
	$xIF.InterfaceDescription, `
	$xIP, `
	$xIPs

# route.exe add 0.0.0.0 mask 0.0.0.0 10.0.1.254 if ?? metric 7777
# PROCESS ALL arguments for route-exe

$x = `
	" add 0.0.0.0 mask 0.0.0.0 {0} if {1} metric 7777" `
	-f $xIP, $xIF.InterfaceIndex

Start-Process `
	-FilePath 'route.exe' `
	-ArgumentList ( $x )





