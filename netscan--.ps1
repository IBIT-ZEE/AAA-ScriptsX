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
# REMOVE <COMMONNAME>
$xItems = `
	$xFiles.BaseName.Substring( $xName.Length ) `
	| Sort-Object `
	| Select-Object -Last ( $xFiles.Length - 2 );


# ALSO REMOVE ???- AND ???--  ->  remove -.ps1 + --.ps1
# $xItems = ( $xFiles | Where-Object { $_ -notin  ".ps1", "-.ps1"  } )

# MENU, MORE...
$xItems += @( "Quit" );

$xOption = AAA-Menu $xItems

# ?QUIT -> Error-Code=1
if ( $xOption -eq $xItems[-1] ){ exit 1 }


# SPECIFIC
""
Write-Host $xItems[ $xOption ];











