

# AAA/ZEE/2023
# DEGUG****
# Invoke-Command -ComputerName $xName -ScriptBlock { Get-Host }; return
#
# OPTIMIZE***
# when remote PS6+ use DOR-OBJECT/TOP and remove WHERE-OBJECT/FIRST


param( $xName = "localhost" )


# 2DO ***
# test if xName is accessible in the network
# needed for remote processes


$xServices = "sevpnclient", "tvnserver", "windefend"

Clear-Host
AAA-Logo

""
String-Center ":::: AAA/Dashboard ::::"
String-Center "......................."

# ----------------------------------------
# PROCESSES...
# ATT*** PS7 has no -Computername options ?WinRM/DCOM
# ?-IncludeUserName




"Processes/CPU-Hogs#10..."
"========================"
Invoke-Command `
	-ComputerName $xName `
	-ScriptBlock {
		Get-Process -IncludeUserName `
			| Sort-Object -Property CPU -Descending `
			| Select-Object -First 10 `
			| Format-Table `
				-Property `
					@{l="PID"; e={ $_.handle }}, `
					Name, `
					CPU, `
					@{ l='Mem/MB'; e={ $_.WorkingSet/1mb }; formatstring="F2" }, `
					UserName
		}


""
String-Fit "-"
"Processes/Memory-Hogs#10..."
"==========================="
Invoke-Command `
	-ComputerName $xName `
	-ScriptBlock {
		Get-Process -IncludeUserName `
			| Sort-Object -Property WorkingSet -Descending `
			| Select-Object -First 10 `
			| Format-Table `
				-Property `
					@{l="PID"; e={ $_.handle }}, `
					Name, `
					CPU, `
					@{ l='Mem/MB'; e={ $_.WorkingSet/1mb }; formatstring="F2" }, `
					UserName
		}

			
# ----------------------------------------
# SERVICES...
# ATT*** PS7 has no -Computername options ?WinRM/DCOM
""
String-Fit "-"
"Services/*..."
"============="
"* checking $xServices..."
""

Invoke-Command `
	-ComputerName $xName `
	-ArgumentList (,$xServices)  `
	-ScriptBlock {param( $x); Get-Service -name $x -ErrorAction SilentlyContinue }




# VMs
""
""
String-Fit "-"
"Hyper-V Virtual Machines..."
"==========================="
try { get-vm -ComputerName $xName | Format-Table } 
catch { "* No Hyper-V service active..." }


""
String-Fit "-"
""



