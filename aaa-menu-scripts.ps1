Param( $xRoot )

<#
.SYNOPSIS
aaa-menu-script <object>
to auto-script-display for the indicated object


.NOTES
1.	get root-command-name from CLI... if none show help
2.	get all types present/unique
3.	set list grouped by type
4.	add ...more/quit
5.	show menu
6.	Execute selected

#>


AAA-Log

if ( $null -eq $xRoot )
	{  

"
	Syntax:

		aaa-menu-scripts <script-root>

		*	List scripts comencing with <script-root>
		*	get automatic all available in #ScriptsX ( `$AAA.Folders.ScriptsX`)
		*	awareness and separate by type (.cmd/.ps1/.csx/.py./...)

	Example:

		aaa-menu-scripts aaa
		aaa-menu-scripts file
		aaa-menu-scripts backup
"

	Exit;
	}


# get all files in the naming form of <root>-*
# if no files got Alert & Exit
$xFiles = Get-ChildItem $aaa.Folders.ScriptsX -Filter "$xRoot-*";

if ( isNull( $xFiles ) )
	{
	AAA-Alert "No files found for $xRoot-*";
	Exit;
	}

# get the UNIQUE types of scripts from $xFiles
# [Array]$xTypes = [Linq.Enumerable]::Distinct( [String[]]$xFiles.extension )
# [Array]$xTypes = [System.Collections.Generic.HashSet[string]] $xFiles.extension 
$xTypes = ( $xFiles.Extension | Select-Object -Unique );


$xNames  = @();
$xGroups = @();

foreach( $e in $xTypes )
	{
	# get the files for the selected extension
	# get the names
	# remove extension (not need in .net core, has name-only property)
	$x1 = $xFiles | Where-Object -Property extension -eq -Value $e;
	$x2 = $x1.Name;
	$x3 = $x2.Replace( "$xRoot-", "" );
	$x4 = $x3.Replace( $e, "" );

	$xNames  += $x4;
	$xGroups += @( $e ) * $x4.Length;

	}


###########################################
# '*' * 256; Get-Variable -Scope local; Exit;
###########################################


# ADD ...more/Quit
$xNames  += "Quit";
$xGroups += "...";

$xOption = AAA-Menu $xNames $xGroups;
""
""

# ?Quit
if ( $xOption -eq $xNames.Length -1 ){ Return }


# else Execute
& ( $xRoot + "-" + $xNames[ $xOption ] )





