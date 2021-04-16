<#

Wake-on-LAN assisted...

#>


AAA-Log

"WOL <> Wake-On-Lan`n"

# MENU DATA LOAD
$xTable = Array-Load ( $AAA.Folders.Data + "\wol-go.dat" )

# MENU, MORE...
$xTable += [PSCustomObject]@{ Id = "Quit"; Group = "More..." };

$xOption = AAA-Menu $xTable.Id $xTable.Group

$xId = $xTable[ $xOption ].Id;

# ?QUIT -> Error-Code=1
if ( $xId -eq $xTable[-1].Id ){ exit 1 }

""
AAA-Alert "Waking device $xId", $xTable[ $xOption ].MAC;
IP-WOL( $xTable[ $xOption ].MAC );
AAA-ProgressFake;











