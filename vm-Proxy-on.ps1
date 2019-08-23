###############################################################################
#
#  VM-Proxy::On
#
#

AAA-Log

$xVM = "Proxy0";
$xPC = "ZEE-OEM";

Write-Host -BackgroundColor 10 -ForegroundColor 0 "$xVM spin up..."

# ATT*** using default credentials
Start-VM -ComputerName $xPC -Name $xVM;

# Stop-vm -ComputerName ZEE-OEM -Name "Proxy0"

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;

