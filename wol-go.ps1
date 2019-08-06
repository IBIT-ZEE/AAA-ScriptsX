<#

Wake-on-LAN assisted...

#>


AAA-Log

"WOL <> Wake-On-Lan`n"

# Menu stuff to obtain a selected-option/string
$xTable = Array-Load ( $AAA.Folders.AAA + "\_data\wol-go.dat" )

# $xMenu  = AAA-Groupify $xTable.Id $xTable.Group
$xOption = AAA-Menu $xTable.Id $xTable.Group
# $xIndex = $xTable.Id.IndexOf( $xOption );

"`n`n"

AAA-Alert ( "Waking device [{0}] -> ( {1} )..." -f $xTable.Id[ $xOption ], $xTable.MAC[ $xOption ] )

IP-WOL( $xTable.MAC[ $xOption ] )

AAA-ProgressFake;









