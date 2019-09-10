Param( $xMatch = "." )

AAA-Log

Get-Process | Where-Object { $_.Name -match $xMatch };

