
# AAA
# inn to clipboard

$xSize = $args.Length;

# if 0 raise error
if ( -not $xSize ){ throw "Clipboard-Set.ps1 no data to insert..." }

# empty clipboard
# important to clear previous content if adding data incrementally
# [System.Windows.Forms.Clipboard]::Clear() ***QUIRK add 1 empty line
Set-Clipboard -value $args[0]

# add data
# foreach( $x in $args ){ Set-Clipboard -append $x }
for( $x=1; $x -lt $xSize; $x++ ) {  Set-Clipboard -append $args[ $x ] }


