Get-NetAdapter |
	ForEach-Object { 
		Write-Host ( "-" * $Host.UI.RawUI.WindowSize.Width); 
		$_ | Format-List * 
		}

