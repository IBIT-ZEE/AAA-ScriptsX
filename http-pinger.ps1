<#
.SYNOPSIS
~

HTTP-Pinger
Ping a site/URI/URL
and show IP or <failed>

~
#>
param( [switch]$verbose )


function Main ( $xVerbose ) 
	{
	AAA-Log

	# WAN
	#	1.	Load Dataset
	#	2.	Get groups by "group"
	# Process groups
	# Process items, if ?<name> use IP
	$xData   = Array-Load  ( "{0}\WAN.dat" -f $aaa.Folders.data );
	$xGroups = Array-toHashgroup $xData "Group";

	each $xGroups.Keys `
		{
		Write-Host ( String-Pad-Center $_ );

		Go $xGroups[ $_ ].Name;

		Write-Host;
		Write-Host ( String-Fit "-" );
		}

	""
	""

	}


function Go( [string[]]$xList ) 
	{ 
	
	# for HTTP
	for( $x = 0; $x -lt $xList.Length; $x++ ) 
		{ 
		Write-Progress `
			-Activity "Testing..." `
			-CurrentOperation $xList[ $x ] `
			-PercentComplete ( ($x / $xList.length) * 100 );

		$xGo = HTTP-Ping -xURL $xList[ $x ] 
		if ( $xGo ) { $xRight = $xGo } else { $xRight = "<failed>";	}

		Write-Host (
			String-Edge `
				-xLeft $xList[ $x ] `
				-xRight $xRight
				)
		} 

	}


# MAIN
Main $verbose;
