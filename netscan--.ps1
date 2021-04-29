<#

Filemenu by filter...

#>


AAA-Log

"netscan-"
"(nirsoft FastResolve based)"
""
""

# CREATE THE FILTER STRING FROM <SCRIPT-NAME>
# THIS SCRIPT SHOULD END ALWAYS END IN '--' SO REMOVE LAST '-'
# CREATE A FILTER-STRING FOR <???-*.*> FILES
$xScript = ( $myInvocation.InvocationName | Split-Path -leafBase )
$xName   = $xScript.Substring( 0, $xScript.Length - 1 );
$xFilter = $xName + "*.*"

# GET THE FILTERED FILES 
# HOLD IN $xFiles YOU MAY NEED A FILE-OBJECT LATER
# ATT*** ?TEST FOR NONE/$NULL
$xFiles = File-Get -xFolder $AAA.Folders.ScriptsX -xFilter $xFilter;

# EXTRACT NAMES INTO A ANOTHER ARRAY
#  Remove <nullname>/???- and "-"/???--
$xItems = `
	$xFiles.BaseName.Substring( $xName.Length ) | `
	Sort-Object | ` 
	Where-Object { $_ -notin "", "-" }

# GET THE 1ST LETTER HASH/BUCKETS for menu GROUPS
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


