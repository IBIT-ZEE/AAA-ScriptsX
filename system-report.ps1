<#
.SYNOPSIS

?CPU ?MEM 
?STORAGE ?total/used/free ?FS ?part
?VOLUMES
?NICS

.NOTES
id/names
boottime, uptime


#>


AAA-Log

$x = Get-CimInstance -ClassName Win32_OperatingSystem

$x.Caption;
$x.Name;

""

String-Fit "SystemDevice", "BootDevice"
String-Fit $x.SystemDevice, $x.BootDevice

""

String-Fit "SystemDirectory", "SystemDrive", "WindowsDirectory"
String-Fit $x.SystemDirectory, $x.SystemDrive, $x.WindowsDirectory

""

String-Fit "Local date", "Last boot", "Install date"
String-Fit $x.LocalDateTime, $x.LastBootUpTime, $x.InstallDate

""
""

"2DO*** rest of info"


# \Device\HarddiskVolume7  
# \Device\HarddiskVolume4  
# C:\Windows\system32  
# C:  
# C:\Windows




<#

$dateTimeProps = 'InstallDate', 'LastBootupTime', 'LocalDateTime', 'CurrentTimeZone', 'CountryCode'
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property $dateTimeProps  



ID                             Value                                                   
----                           -----                                                   
Caption                        Microsoft Windows 10 Pro                                
OSType                         18
Version                        10.0.19041
BuildNumber                    19041                                                   
BuildType                      Multiprocessor Free                                     
OperatingSystemSKU             48
OSArchitecture                 64-bit                                                  
OSLanguage                     2057                                                    
OSProductSuite                 256                                                     
+
SerialNumber                   00331-10000-00001-AA092
SuiteMask                      272
+
MUILanguages                   {en-GB, pt-PT}                                          
CurrentTimeZone                60
Locale                         0809
CodeSet                        1252                                                    
CountryCode                    44                                                      


// STORAGE
FreePhysicalMemory             9313660                                                 
FreeSpaceInPagingFiles         2020280                                                 
FreeVirtualMemory              10239476                                                
+
TotalVirtualMemorySize         19109432                                                
TotalVisibleMemorySize         16619064
TotalSwapSpaceSize             <null>
SizeStoredInPagingFiles        2490368                                                 
+
SystemDevice                   \Device\HarddiskVolume7
BootDevice                     \Device\HarddiskVolume4                                 
SystemDirectory                C:\Windows\system32                                     
SystemDrive                    C:                                                      
WindowsDirectory               C:\Windows


// PROCESSES
NumberOfProcesses              227
MaxNumberOfProcesses           4294967295                                              
MaxProcessMemorySize           137438953344                                            
Debug                          <null>                                                  
EncryptionLevel                256                                                     
ForegroundApplicationBoost     2
+
DataExecutionPrevention_32B... True                                                    
DataExecutionPrevention_Ava... True                                                    
DataExecutionPrevention_Dri... True                                                    
DataExecutionPrevention_Sup... 2                                                       


// TIME
LocalDateTime                  2020-07-09 13:27:50
LastBootUpTime                 2020-07-09 12:10:27
InstallDate                    2020-06-21 20:55:49


// DIRECTORY 
RegisteredUser                 OEM
CSName                         ZEE-PC
Status                         OK                                                      
Distributed                    <null>                                                  
NumberOfUsers                  2


// XXX
Description                    <null>
OtherTypeDescription           <null>
CSDVersion                     <null>                                                  
ServicePackMajorVersion        <null>                                                  
ServicePackMinorVersion        <null>                                                  
+
LargeSystemCache               <null>
NumberOfLicensedUsers          <null>
Organization                   <null>                                                  
PAEEnabled                     <null>                                                  
PlusProductID                  <null>                                                  
PlusVersionNumber              <null>                                                  
PortableOperatingSystem        <null>                                                  
PSComputerName                 <null>
Primary                        True
ProductType                    1
CimClass                       root/cimv2:Win32_OperatingSystem
CimInstanceProperties          {Caption, Description, InstallDate, Name...}
CimSystemProperties            Microsoft.Management.Infrastructure.CimSystemProperties


// REDUNDANT
Name                           Microsoft Windows 10 Pro|C:\Windows|\Device\Harddisk4...
Manufacturer                   Microsoft Corporation
CreationClassName              Win32_OperatingSystem
CSCreationClassName            Win32_ComputerSystem


#>

