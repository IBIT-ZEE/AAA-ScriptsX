###############################################################################
#
#	1.	Stop VM
#	2.	Find+Close process Hyper-V/vmConnect.exe
#	3.	Attach Disk#x again
#

AAA-Log

# $xVM = "_bios-gen2-efi";
$xVM = "_storage-2-efi";
$xDisk = 5;

Write-Host -BackgroundColor 10 -ForegroundColor 0 "Stopping VM $xVM..."
Stop-VM -Name $xVM -Force;

Write-Host -BackgroundColor 11 -ForegroundColor 1 "Closing RDC Window..."
Get-Process | Where-Object -Property name -EQ "vmconnect" | Stop-Process;

Write-Host -BackgroundColor 12 -ForegroundColor 2 "Onlining disk $xDisk..."
Set-Disk -Number $xDisk -IsOffline $false;



