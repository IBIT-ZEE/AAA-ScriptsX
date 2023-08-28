# AAA
# append to clipboard

$xSize = $args.Length;

# if 0 raise error
if ( -not $xSize ){ throw "Clipboard-Set.ps1 no data to insert..." }

# Set-Clipboard -value $args[0]
# add data
foreach( $x in $args ){ Set-Clipboard -append $x }
# for( $x=1; $x -lt $xSize; $x++ ) {  Set-Clipboard -append $args[ $x ] }
