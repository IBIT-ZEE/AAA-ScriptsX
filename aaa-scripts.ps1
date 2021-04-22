<#

AAA-Scripts <scriptname->

to be invoked by <scriptname--.cmd ~> aaa-scripts.ps1 %~n0

show scripts from the stem/root
and launch choosen one...

#>

Param( [string]$xScript )

AAA-Log

# ? arg0 not null
if ( $null -eq $xScript )
	{ 
"
	AAA-Scripts <name->
	
	Will present a menu of all scripts ( AAA.Folders.ScriptsX )
	beginning with the same name stem
	and launch the choosen one
"

	exit 1;
	}


Pattern-Line
""
String-Pad-Center $xScript.ToUpper();
Pattern-Line
""


$xFolder = $AAA.Folders.ScriptsX
# ? exist <scriptname-*.*>


# CREATE THE FILTER STRING FROM <SCRIPT-NAME>
# THIS SCRIPT SHOULD END ALWAYS END IN '--' SO REMOVE LAST '-'
# CREATE A FILTER-STRING FOR <???-*.*> FILES
# $xScript = ( $myInvocation.InvocationName | Split-Path -leafBase )
# $xName   = $xScript.Substring( 0, $xScript.Length - 1 );
$xFilter = $xScript + "*.*"

# GET THE FILTERED FILES 
# HOLD IN $xFiles YOU MAY NEED A FILE-OBJECT LATER
# ATT*** ?TEST FOR NONE/$NULL
$xFiles = File-Get -xFolder $xFolder -xFilter $xFilter;

# EXTRACT NAMES INTO A ANOTHER ARRAY
#  Remove <nullname>/???- and "-"/???--
$xItems = `
	$xFiles.BaseName.Substring( $xScript.Length ) | `
	Sort-Object | `
	Where-Object { $_ -notin "", "-" }

# GET THE 1ST LETTER HASH/BUCKETS for menu GROUPS
$xGroups = ( map -xData $xItems -xLambda { $_.Head(1) } )
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
	-NoNewWindow `
	-FilePath ( "{0}\{1}{2}" -f $AAA.Folders.ScriptsX, $xScript, $xItems[ $xOption ] ) 


