# ON ...
# OFF ...
# FILES...
# HYPER-V DISKS ...
# >QUIT<


function Main
	{
	AAA-Log

	$xMenu = Array-Load ( $AAA.Folders.AAA + "\_data\vm-go.dat" );
	$xOption = AAA-Menu $xMenu.Name $xMenu.Group;

	$xName  = $xMenu[ $xOption ].Name;
	$xGroup = $xMenu[ $xOption ].Group;

	switch ( $xGroup ) 
		{
		"On"    { On    $xName }
		"Off"   { Off   $xName }
		"files" { Files $xName }
		Default {}
		}

	}


function On( $xName )
	{
	"Turning -ON- VM $xName..."
	""
	# RUN
	& ( "vm-" + $xName + "-on.ps1" )
	}


function Off( $xName )
	{
	"Turning -OFF- VM $xName..."
		""
		}


Main;