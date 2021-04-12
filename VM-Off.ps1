###############################################################################
#
#  VM-Proxy::Off
#
#


Param( $xVM, $xPC = 'localhost' )

AAA-Log

if ( [string]::isNullOrEmpty( $xVM ) )
	{
	"
	Syntax:
	
		VM-Off <xVM> [ <xPC> ]
	
	Please specify a PC name (or localhost is assumed)
	and a VM name...
	"
	
	exit;
	}


Write-Host -BackgroundColor 10 -ForegroundColor 0 "$xVM spin down..."

# ATT*** using default credentials

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;
Stop-vm -ComputerName $xPC -Name $xVM



