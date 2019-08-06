<#



#>

########################################
#  |B|2|B|
#  |J|P|D|I|
#


# Param( $p1="123", $p2 )


AAA-Log

"CPC-DI`n`n"
$xTable = Array-Load( "{0}\`$KBZ\b2b-jpdi.dat" -f $AAA.DAT )
$xIndex = AAA-Menu( $xTable.Id )

"`n"

for ( $x = 0; $x -le 100; $x++ ) 
	{ Write-Progress -Activity "Running..." -Status "$x" -PercentComplete "$x"; Start-Sleep -Milliseconds 1 }

"`n`n"







