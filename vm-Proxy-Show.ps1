###############################################################################
#
#  VM-Proxy::On
#
#

AAA-Log

$xVM = "Proxy0";
$xPC = "ZEE-OEM";

Start-Process -FilePath "vmconnect.exe" -ArgumentList $xPC, $xVM;

