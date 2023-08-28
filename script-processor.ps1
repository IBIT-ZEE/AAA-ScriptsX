

function main( $xArgs )
	{
	# if ( -not $args.length){ throw "Script-Processor.ps1/need args..." }
	$xScript = try { $xArgs[0] } catch { $null }
	$xAction = try { $xArgs[1] } catch { $null }

	if ( -not $xScript ){ Help "Must indicate a script..."; return; }
	if ( -not $xAction ){ Help "Must supply an action to take on $xScript"; return; }

	return
	}

function Help( $x )
	{
	AAA-Message "Script-Processor <script> [action]", $x
	}

# ***** GO *****
main $args


