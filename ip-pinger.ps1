<#
.SYNOPSIS
Template for AAA *- commands
Boilerplate/Skeleton for scripts
Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications


.NOTES
...

#>


# process Hosts.DBX ???
$xLocal1 = @( "zee-pc", "zee-lt", "zee-oem" );
$xLocal2 = @( "server0", "Proxy0", "Work", "WorkX" );
$xLocal3 = @( "tech0", "tech5", "tech8" );
$xWWW1   = @( "pinkreef.pt", "7galerias.pt", "bordalima.pt", "cinderela-portugal.pt" );
$xWWW2   = @( "ibit.softether.net", "ibit-work.softether.net" );
$xWWW3   = @( "ibit.dynu.net" );


$xColor = @{}

function Main () 
	{
	AAA-Log

	Console-Color-Save $xColor;

	String-Pad-Center "[LAN/Subnet/Local]" "_";
	""
	Go $xLocal1 "ICMP"; String-Replicate "-";
	Go $xLocal2 "ICMP"; String-Replicate "-";
	Go $xLocal3 "ICMP";
	""

	String-Pad-Center "[WWW]" "_"
	""
	Go $xWWW1 "HTTP"; String-Replicate "-";
	Go $xWWW2 "HTTP"; String-Replicate "-";
	Go $xWWW3 "HTTP";
	""
	# ...

	<#
	String-Pad-Center "[DDNS/*.dynu.net]" "_";
	Strings-Fit ""
	Strings-Fit $xDDNS; Strings-Fit ( Go1 $xDDNS ); Strings-Fit ""; Console-Color-Invert;
	""
	# ...
	Console-Color-Restore $xColor;
	#>
	

	}


function Go( $xList, $xProto = "ICMP" ) 
	{ 
	
	# Protocol leverage
	switch ($xProto) 
		{
		ICMP { $xCode = { IP-Ping   $args[0] } }
		HTTP { $xCode = { HTTP-Ping $args[0] } }
		}

	for( $x = 0; $x -lt $xList.Length; $x++ ) 
		{ 
		Write-Progress `
			-Activity "Testing..." `
			-CurrentOperation $xList[ $x ] `
			-PercentComplete ( ($x / $xList.length) * 100 );

		String-Edge `
			-xLeft $xList[ $x ] `
			-xRight ( GoX -xIn $xList[ $x ]  -xCode $xCode ); 
		} 
	}

function GoX( $xIn, $xCode )
	{
	$x = ( Invoke-Command -ScriptBlock $xCode -ArgumentList $xIn )
	if ( $x ) { $xResult += $x } else { $xResult += "<failed>"; }
	return $xResult
	}



Main;
