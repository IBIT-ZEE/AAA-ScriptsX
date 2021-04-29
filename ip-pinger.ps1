<#
.SYNOPSIS
~

Template for AAA *- commands
Boilerplate/Skeleton for scripts
Goal : Unify COnsole+GUI+MicroConsole+Languages+Utils+Applications

~
#>
param( [switch]$verbose )


function Main ( $xVerbose ) 
	{
	AAA-Log

	# LAN
	#	1.	Load Dataset
	#	2.	Get groups by "group"
	#	3.	Process ?name-to-IP
	# Process groups
	# Process items, if ?<name> use IP
	$xData   = Array-Load  ( "{0}\LAN.dat" -f $aaa.Folders.data );
	$xGroups = Array-toHashgroup $xData "Group";

	each $xGroups.Keys `
		{
		Write-Host ( String-Pad-Center $_ );

		# if ?<name> or IP
		$xDevices = @();
		foreach( $xGi in $xGroups[ $_ ] )
			{ 
			foreach( $xOi in $xGi )
				{ $xDevices += ( iif ( $xOi.name.head(1) -ne "?" ) $xOi.Name $xOi.IP ); }
			}
		
		Go $xDevices;

		Write-Host ( String-Fit "-" );
		}

	""
	""

	}


function Go( [string[]]$xList ) 
	{ 
	
	# for PING/ICMP
	$xError  = "";
	$xWarn   = "";
	$xErrors = "";
	$xWarns  = "";
	for( $x = 0; $x -lt $xList.Length; $x++ ) 
		{ 
		Write-Progress `
			-Activity "Testing..." `
			-CurrentOperation $xList[ $x ] `
			-PercentComplete ( ($x / $xList.length) * 100 );

		$xGo = `
			Test-NetConnection `
				-ComputerName $xList[ $x ] `
				-ErrorAction SilentlyContinue `
				-WarningAction SilentlyContinue `
				-ErrorVariable xError `
				-WarningVariable xWarn;
			
		if( $xError ){ $xErrors += $xError + "`n" }
		if( $xWarn  ){ $xWarns  += $xWarn  + "`n" }

		if ( $xGo.PingSucceeded ) 
			{

			$xRight = "{0}/{1}/{2}/{3}" -f `
				$xGo.SourceAddress.IPAddress,  `
				$xGo.SourceAddress.InterfaceAlias,  `
				$xGo.RemoteAddress.IPAddressToString, `
				( iif $xGo.NameResolutionSucceeded "DNS=OK" "DNS=KO" );

			} 
		else 
			{ 
			$xRight = "<failed>";
			}

		Write-Host (
			String-Edge `
				-xLeft $xList[ $x ] `
				-xRight $xRight
				# -xRight ( GoX -xIn $xList[ $x ]  -xCode $xCode )
				)
		} 

		# Show Errors/Warnings
		# Text bring trailing "`n" from previous <error/warn>+"`n"
		Write-Host
		if ( $xVerbose -and ( $xErrors -or $xWarns ) )
			{
			if ( $xErrors )
				{
				Write-Host "*Errors"
				Write-Host $xErrors;
				}

			if ( $xWarns )
				{
				Write-Host "*Warnings"
				Write-Host $xWarns;
				}
			}

	}


# MAIN
Main $verbose;
