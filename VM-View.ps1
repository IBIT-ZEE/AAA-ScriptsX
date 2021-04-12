###############################################################################
#
#  VM-Proxy::On
#
#

param( $xVM, $xPC = 'localhost' )


AAA-Log

if ( [string]::IsNullOrEmpty( $xVM ) )
	{
	"
	Syntax:
	
		VM-View <xVM> [ <xPC> ]
	
	Please specify a PC name (or localhost is assumed)
	and a VM name...
	"
	
	exit;
	}

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;


