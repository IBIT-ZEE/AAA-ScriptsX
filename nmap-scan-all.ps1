
<#
nmap by gateway
/24... or decide by netmask/(Get-netIPAddress -index ?).PrefixLenght

IMPLEMENT
* get command line IP & MASK...
* scan as a job
* show progress bar/moulin/dots...

AAA new concepts to implement
* ?var-isNull( $x )
* ?var-has( @( a, b, ...) )

#>


# get Gateways/NextHop
# all but ipv4/0.0.0.0 or ipv6/::
$xGW  = $null
$xGWs = ( Get-NetRoute | Where-Object { $_.NextHop -ne "0.0.0.0" -and $_.NextHop -ne "::" } )
$xMask = "24";

AAA-Alert "", "AAA NMAP'er", "";
""

# ?0 = no gateways |Alert !Exit
if ( $null -eq $xGWs )
	{ 
	AAA-Alert "No default Gateway present..."  
	Return;
	}


# ?N = multiple gateways !choose one
if ( $xGWs.Length -gt 1 )
	{ 
	$xOptions = $xGWs.NextHop;
	$xGroups  = ( ,"IP-Ranges by Gateways" * $xOptions.Length );

	# ?Wanna quit option...
	$xGroups  += "..."
	$xOptions += "Quit..." ;

	$xOption  = AAA-Menu $xOptions $xGroups;

	# ?Quit
	if ( $xOption -eq $xGWs.Length ){ Return }

	# Choosen option
	$xGW = $xOptions[ $xOption ];
	}


# ?1 = grab this
# ?not-defined-yet?? then grab the first/only option...
if ( $null -eq $xGW ){ $xGW = $xGWs[0].NextHop }


# UI 
""
"NMAP'ing... $xGW/$xMask"
""

# ?job feedback -> ?progress-bar ?moulin ?dots...
# NMAP (shell) the thing
nmap "$xGW/$xMask";

# Resolved...
Sound-Beep;




