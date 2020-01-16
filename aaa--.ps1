
$xFile = $MyInvocation.MyCommand.Name;

""

# alter suffix *-- to *- and add all wildcard...
$xFile = $xFile.Replace( "-.ps1", "" );

# get files *.cmd/*.ps1/*.???
$xFiles = Get-ChildItem $aaa.Folders.ScriptsX -Filter "$xFile*";

# separate .cmd from .ps1 ... ?bat ?xml ?py ?cfg ???
$xFilesPS = ( $xFiles | Where-Object { $_.extension -eq  ".ps1" } ).Name;
$xFilesBS = ( $xFiles | Where-Object { $_.extension -eq  ".cmd" } ).Name;

$xFilesPS = $xFilesPS | ForEach-Object { $_.Replace( ".ps1", "" ) };
$xFilesBS = $xFilesBS | ForEach-Object { $_.Replace( ".cmd", "" ) };

$xGroupPS = ( ,"Powershell" ) * $xFilesPS.Count;
$xGroupBS = ( ,"DOS/Batch"  ) * $xFilesBS.Count;

$xFiles  = $xFilesPS + $xFilesBS + "Quit";
$xGroups = $xGroupPS + $xGroupBS + "...";
$xFiles = $xFiles | ForEach-Object { $_.Replace( $xFile, "" ) };

$xOption = AAA-Menu $xFiles $xGroups;
""
""

# ?Quit the exit
if ( $xOption -eq $xFiles -1  ){ Return }


# else Execute
& ( $xFile + $xFiles[ $xOption ] )




