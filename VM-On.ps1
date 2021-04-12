###############################################################################
#
#  VM-Proxy::On
#
#

Param( $xVM, $xPC = 'localhost' )

AAA-Log

if ( [string]::isNullOrEmpty( $xVM ) )
	{
	"
	Syntax:
	
		VM-On <xVM> [ <xPC> ]

	
	Please specify a PC name (or localhost is assumed)
	and a VM name...
	"
	
	exit;
	}



Write-Host -BackgroundColor 10 -ForegroundColor 0 "$xVM spin up..."

# ATT*** using default credentials
Start-VM -ComputerName $xPC -Name $xVM;

# Stop-vm -ComputerName ZEE-OEM -Name "Proxy0"

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;

