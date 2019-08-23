<#

C:\APL\Mozilla\Thunderbird\thunderbird.exe

Thunderbird-
	Forum
	Knowledgebase
	Stackoverflow https://stackoverflow.com/search?q=[thunderbird]+powershell

C:\APL\Google\Chrome64\Application\chrome.exe --user-data-dir=C:\XXX\Chrome\zee
C:\APL\Mozilla\Firefox64\firefox.exe -profile C:\XXX\Firefox\ZEE
C:\APL\Opera\Browser\launcher.exe --user-data-dir="C:\XXX\Opera\ZEE"

2019.07.18

#>

Set-StrictMode -Version 5

AAA-Log;

# SCREEN
AAA-Alert ( String-Center "Thunderbird" )

$xData = Array-Load ( $AAA.Folders.AAA + "\_data\thunderbird-go.dat" );
$xName  = $xData.Name;
$xGroup = $xData.Group;

$xName  += "Quit...";
$xGroup += "...";

# DISPLAY
""
$xIndex = AAA-Menu $xName $xGroup;
""
""

# ?QUIT if last element choosen
if ( $xIndex -eq $xName.Length -1 ) { return }

$xCommand = $xData.Command[ $xIndex ];
$xArgs    = $xData.Args[ $xIndex ];

"Running..."
$xCommand
$xArgs

# LAUNCH
# . $xData.Command[ $xIndex ];
Start-Process -FilePath $xCommand -ArgumentList $xArgs;

