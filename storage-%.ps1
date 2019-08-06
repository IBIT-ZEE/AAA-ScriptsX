<#

+++
Win32_DiskDrive			~physical disks.
Win32_DiskPartition		~partitions on the physical disks
Win32_LogicalDisk		~filesystems inside the partitions.
+
Win32_DiskDriveToDiskPartition	~map partitions to disks
Win32_LogicalDiskToPartition	~map drives their partitions 

#>

AAA-Log

$xOption = AAA-Menu "Drives-Basic", "Drives-Tech+", "Drives-Tech++"

###############################################################################
# ERR***REFACTOR
$xOptions =
	@( 
	"DiskNumber, OperationalStatus, FriendlyName, NumberOfPartitions, PartitionStyle",
	"Location,PhysicalSectorSize,LogicalSectorSize,Size,AllocatedSize,LargestFreeExtent",
	"Path, HealthStatus, SerialNumber, Signature, UniqueId, CimClass"
	)

$x = $xOptions[ $xOption ]


$x = ( 
	Get-Disk `
	| Select-Object -Property DiskNumber, FriendlyName, OperationalStatus, Size, SerialNumber, Signature, UniqueId, NumberOfPartitions, PartitionStyle `
	| Out-Gridview -PassThru ) 





