<#

C:\APL\Google\Chrome64\Application\chrome.exe --user-data-dir=C:\XXX\Chrome\zee
C:\APL\Mozilla\Firefox64\firefox.exe -profile C:\XXX\Firefox\ZEE
C:\APL\Opera\Browser\launcher.exe --user-data-dir="C:\XXX\Opera\ZEE"

2019.07.18
#>

Set-StrictMode -Version 5

$xBrowser = "C:\APL\Google\Chrome64\Application\chrome.exe"
$xArgs =  @()

AAA-Log;

# SCREEN
AAA-Alert ( String-Center "Agenda Docs Drive Mail Notes ..." )

"[Cloud] ~> controls services to use"
"[User]  ~> controls the Browser-Profile"
""
"[USER] [CLOUD] [SERVICES]"
""

# PROFILE
String-Line;
"?User/Profile"
""
$xUser = AAA-Menu @( "ZEE", "AAA", "IBIT", "PINKREEF" );
""
""

# SERVICE
$xData = Array-Load ( $AAA.AAA + "\_data\www-go.dat" );
# $xFlat = AAA-Groupify $xData.Name $xData.Group;
String-Line;
"?Cloud/Services"
""
$xService = AAA-Menu $xData.Name $xData.Group;
""
""


# LAUNCH
$xArgs += "--user-data-dir=C:\XXX\Chrome\$xUser"
$xArgs += $xData.URL[ $xData.Name.IndexOf( $xService ) ];

# Start-Process -FilePath $xBrowser -ArgumentList $xArgs

function Show( ) 
	{
	""
	""
	$xData.IndexOf( $xService )
	""
	$xUser;
	$xService;
	$xArgs[0];
	$xArgs[1];
	$xBrowser;
	}
Show;



