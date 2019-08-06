###############################################################################
#
#  VM-EFI On for Hyper-V gen2
#
#  1. Offline the disk (disk#)
#  2. Launch Hyper-V/vmConnect.exe on the VM
#
#
# ??? VM-ON :: xContext { xVM = vm-name; xDisk = disk-number  }
#

<# 
1.	get property bag for <scriptname>
2.	is error fill with defaults
3.	determine if expired ?+24h
4.	if expired re-ask for new selection
5.	if storage-device-id difference ask for new selection
6.	if not unique alert
7.	on exit persist
#>

Set-StrictMode -Version 5

function main 
	{
	AAA-Log

	$xVM = "_storage-2-efi";

	# Get current script name from PSCallStack[0] 
	# and change the extension to .cfg
	$xConfig = (Get-PSCallStack)[0].ScriptName -replace ".ps1", ".cfg"

	try { $xData = Import-Clixml -Path $xConfig	}
	catch 
		{
		$xData = AAA-Bag;
		$xData += @{ Selected = 1; Signature = $null } 
		}
	
	# ?Expired

	$xDate = $xData.Date;

<#
--------------------------------------------------------------------------------
continue...

try load config -> if error fill object with defaults

compare with current date
get also last choice# and key#

if expires
if key<>

---------------------------------------------------------------------------------
#>
	



	# volatile session environment variable
	$xId = ${Env:vm-efi-xDisk};

	# if variable was not defined
	if ( $xId -eq $null ) 
		{ 
		$xId = aaaDiskNumber;
		# ?CANCELED
		if ( $x -eq $null ) { throw( "***** USER CANCEL *****" ) } 
	
		${Env:vm-efi-xDisk} = $xId;

		#Set-Item -Path Env:vm-efi-xDisk -Value $xId
		#[System.Environment]::SetEnvironmentVariable( "vm-efi-xDisk", $xID, [System.EnvironmentVariableTarget]::Process)
		#[System.Environment]::SetEnvironmentVariable( "vm-efi-xDisk", $xID, [System.EnvironmentVariableTarget]::Machine)
		#[System.Environment]::SetEnvironmentVariable( "vm-efi-xDisk", $xID, [System.EnvironmentVariableTarget]::User)
		}

	#?CONFIRM
	$x = AAA-MessageOC( "Selected disk $xID..." )
	if ( $x -ne "OK" ) { throw( "***** USER CANCEL *****" ) }



@"
id = $xId
vm-efi-xdisk = ${Env:vm-efi-xDisk}
"@
break zee

	Write-Host -BackgroundColor 2 -ForegroundColor 7 "Offlining disk $xDisk..."
	Set-Disk -Number $xDisk -IsOffline $true;

	Write-Host -BackgroundColor 2 -ForegroundColor 7 "Starting VM $xVM..."
	Start-VM -Name $xVM;

	Start-Process -FilePath "vmconnect.exe" -ArgumentList localhost, $xVM;

	}


function aaaDiskNumber
	{
	$x = `
		Get-Disk `
			| Select-Object -Property DiskNumber, FriendlyName, OperationalStatus, Size, SerialNumber, Signature, UniqueId, NumberOfPartitions, PartitionStyle `
			| Out-Gridview -PassThru
	
	Return $x.DiskNumber
	}


main;