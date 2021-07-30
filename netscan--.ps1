<#

Filemenu by filter...


2DO***
detect if selected ip exists
before call the scanner


#>


AAA-Log

"netscan-"
"(nirsoft FastResolve based)"
""
""

# Create the filter string from <script-name>
# this script should end always end in '--' so remove last '-'
# create a filter-string for <???-*.*> files
$xScript = ( $myInvocation.InvocationName | Split-Path -leafBase )
$xName   = $xScript.Substring( 0, $xScript.Length - 1 );
$xFilter = $xName + "*.*"

# Get the filtered files 
# hold in $xfiles you may need a file-object later
# att*** ?test for none/$null
$xFiles = File-Get -xFolder $AAA.Folders.ScriptsX -xFilter $xFilter;

# Extract names into a another array
# Remove <nullname>/???- and "-"/???--
$xItems = `
	$xFiles.BaseName.Substring( $xName.Length ) | `
	Sort-Object | ` 
	Where-Object { $_ -notin "", "-" }

# Get the 1st letter hash/buckets for menu groups
$xGroups = ( map -xData $xItems -xLambda { $_.Split( '-' )[0] } )
# $xItems  += @( "Quit" );
# $xGroups += @("more...");
$xItems  += "Quit";
$xGroups += "more...";

$xOption = AAA-Menu $xItems $xGroups

# ?QUIT -> Error-Code=1
if ( $xOption -eq $xItems.Length - 1  ){ exit 1 }


# SPECIFIC
""
Start-Process `
	-FilePath ( "{0}\{1}{2}" -f $AAA.Folders.ScriptsX, $xName, $xItems[ $xOption ] )


