Add-Type -AssemblyName System.ServiceProcess;

[System.Enum]::GetValues( [System.ServiceProcess.ServiceControllerStatus] ) `
| ForEach-Object `
	{ `
	"*" * $Host.UI.RawUI.WindowSize.Width; "{0} ({1})" -f $_, $_.value__; Get-Service `
	| Where-Object -Property Status -eq $_ `
	| Format-Table Name, Displayname -AutoSize -HideTableHeaders; `
	"`n`n" `
	}
