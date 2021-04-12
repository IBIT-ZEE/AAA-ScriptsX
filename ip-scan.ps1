################################################################################
#
#	1.	Get Current IP
#	2.	Get Current mask
#	3.	
#
#
#	Get-NetIPAddress | Out-GridView -passthrough  ???Select-Object *
#	"10.0.0.0" -split "\."
#	[System.Net.IPAddress]"10.0.1.1"
#	[System.Net.IPAddress]
#
#	Write-Progress -Activity "Scan IP Range $StartScanIP $EndScanIP" -Status "Scaning:" -Percentcomplete (0) 
#	[System.Net.Dns]::GetHostbyAddress($IP).HostName 
#
#	$WMIObj = [WMISearcher]''   
#	$WMIObj.options.timeout = '0:0:10'  
#	$WMIObj.scope.path = "\\$IP\root\cimv2"   
#	$WMIObj.query = "SELECT * FROM Win32_OperatingSystem"   
#	$Result = $WMIObj.get()   
#
#	$OS_Name = $Result | Select-Object -ExpandProperty Caption 
#	$OS_Ver = $Result | Select-Object -ExpandProperty Version 
#	$OS_CSDVer = $Result | Select-Object -ExpandProperty CSDVersion 
#	$OS_Ver += " $OS_CSDVer" 
#


AAA-Log 


// get current




