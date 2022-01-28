@wmic ^
	process ^
		where (caption!='WMIC.exe' AND commandline like '%%%~1%%' ) ^
		get processid,priority,name,sessionid,status,threadcount,workingsetsize ^
		/format:table

@exit /b


:OBS
*FILESYSTEM
Name=WMIC.exe
Caption				=WMIC.exe
CommandLine			=wmic  process get * /format:value
Description			=WMIC.exe
ExecutablePath		=C:\Windows\System32\Wbem\WMIC.exe
ExecutionState		=

*PROCESS
ProcessId			=2644
ParentProcessId		=12984
Priority			=8
ThreadCount			=7
Handle				=2644
HandleCount			=170
KernelModeTime		=0
UserModeTime		=156250
SessionId			=1
Status				=

CreationClassName	=Win32_Process
CreationDate		=20211208191149.839729+000
CSCreationClassName	=Win32_ComputerSystem
CSName				=ZEE-PC

OSCreationClassName	=Win32_OperatingSystem
OSName				=Microsoft Windows 10 Pro|C:\Windows|\Device\Harddisk3\Partition1
WindowsVersion		=10.0.19043

*MEMORY
WorkingSetSize			=12009472
VirtualSize				=2203427332096
WriteOperationCount		=0
WriteTransferCount		=0
MaximumWorkingSetSize	=1380
MinimumWorkingSetSize	=200
PeakPageFileUsage		=2568
PeakVirtualSize			=2203427332096
PeakWorkingSetSize		=11812
QuotaNonPagedPoolUsage	=12
QuotaPagedPoolUsage		=135
QuotaPeakNonPagedPoolUsage=12
QuotaPeakPagedPoolUsage	=135
PageFaults				=3174
PageFileUsage			=2352
PrivatePageCount		=2408448

*IO
ReadOperationCount		=2
ReadTransferCount		=2866
OtherOperationCount		=148
OtherTransferCount		=1802

*
InstallDate			=
TerminationDate		=







C:\Users\ZEEX>wmic process get * /format:value