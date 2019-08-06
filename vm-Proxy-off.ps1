###############################################################################
#
#  VM-Proxy::Off
#
#

AAA-Log

$xVM = "Proxy0";
$xPC = "ZEE-OEM";

Write-Host -BackgroundColor 10 -ForegroundColor 0 "$xVM spin down..."

# ATT*** using default credentials

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;
Stop-vm -ComputerName $xPC -Name $xVM



