<#
Read .dat (list of available vm(s))
	Groups generate Menus for:
		connect
		disconnect
		startup
		shutdown
		Files
		EFI-
		Kick-On/EFI-Kill-Off


#>
function Main
	{
	AAA-Log

	AAA-Alert `
		( `
		String-Center `
			"                                 ", `
			"  AAA Virtual Machine Operation  ", `
			"   (default engine is Hyper-V)   ", `
			"                                 " `
			"*" `
		)

	$xData = Array-Load ( $AAA.Folders.AAA + "\_data\vm-go.dat" );

	# CHOOSE VM
	String-Line;
	"";
	String-Center "1/2 Choose VM to work on...";
	"";

	$xMenu  = $xData.Name;
	$xGroup = $xData.Group;
	# Control...
	$xGroup += "More...";
	$xMenu  += "Quit";

	$xOption = AAA-Menu $xMenu $xGroup;
	$xVM  = $xMenu[ $xOption ];

	# ?QUIT
	if ( $xVM -eq $xMenu[ - 1] ) { return }


	# CHOSE ACTION
	String-Line;
	"";
	String-Center "2/2 Choose action to perform on VM...";
	"";
	
	$xMenu  = @( "Connect", "Disconnect", "Startup", "Shutdown", "Files" );
	$xGroup = ( @( "Actions" ) * $xMenu.Length )
	# Control...
	$xGroup += "More...";
	$xMenu  += "Quit";

	$xOption = AAA-Menu $xMenu $xGroup;
	$xAction = $xMenu[  $xOption ];
	$xPC     = $xGroup[ $xOption ];

	# ?QUIT
	if ( $xAction -eq $xMenu[ - 1] ) { return }

	# DYNAMIC FUNCTION CALL
	&$xAction $xVM $xPC
	
	}


function Connect( $xName, $xPC )
	{
	# $MyInvocation;
	Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;
	}


function Disconnect( $xName )
	{
	$MyInvocation;
	}

function Startup( $xName, $xPC )
	{
	$MyInvocation;
	return;
	"Turning -ON- VM $xName..."
	""
	# RUN
	& ( "vm-" + $xName + "-on.ps1" )
	}


function Shutdown( $xName, $xPC )
	{
	$MyInvocation;
	"Turning -OFF- VM $xName..."
	""
	}


function Files( $xName, $xPC )
	{
	$MyInvocation;
	}

Main;

