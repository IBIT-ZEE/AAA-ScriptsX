Param( $xMatch )

AAA-Log

if ( $null -eq $xMatch ) 
	{ 
	"`t`$xMatch regex filter"
	""
	"`tTo kill all use . (regex)" 
	""
	Exit
	}

Get-Process | Where-Object { $_.Name -match $xMatch } | Stop-Process

