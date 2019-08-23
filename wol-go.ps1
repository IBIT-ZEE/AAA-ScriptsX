<#

Wake-on-LAN assisted...

#>


AAA-Log

"WOL <> Wake-On-Lan`n"

# MENU DATA LOAD
$xTable = Array-Load ( $AAA.Folders.AAA + "\_data\wol-go.dat" )

# MENU, MORE...
$xTable += [PSCustomObject]@{ Id = "Quit"; Group = "More..." };

$xOption = AAA-Menu $xTable.Id $xTable.Group

$xId = $xTable[ $xOption ].Id;

# ?QUIT -> Error-Code=1
if ( $xId -eq $xTable[-1].Id ){ exit 1 }

""
String-Line;
"Waking device [{0}] -> ( {1} )..." -f $xId, $xTable.MAC[ $xOption ] 
# String-Center ( "Waking device [{0}] -> ( {1} )..." -f $xId, $xTable.MAC[ $xOption ] )
# AAA-Alert ( "Waking device [{0}] -> ( {1} )..." -f $xTable.Id[ $xOption ], $xTable.MAC[ $xOption ] )
IP-WOL( $xTable.MAC[ $xOption ] );
AAA-ProgressFake;;









