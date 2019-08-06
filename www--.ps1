<#



2019.07.18
#>


AAA-Log;

AAA-Alert "Agenda Docs Drive Mail Notes ..."

"[Cloud] ~> controls services to use"
"[User]  ~> controls the Browser-Profile"

""

"[USER] [CLOUD] [SERVICES]"
""

"?User/Profile"
$xUser = AAA-MenuX @( "ZEE", "AAA", "IBIT", "PINKREEF" );
$xData = Array-Load ( $AAA.AAA + "\_data\www-go.dat" );
$xFlat = AAA-Groupify $xData.Name $xData.Group;

""
"?Cloud/Services"
$x = AAA-Menu $xFlat;





