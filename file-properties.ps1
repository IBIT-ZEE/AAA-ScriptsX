<#
Windows Shell File/Folder properties dialog invocation

? recurse if multiple files
#>

AAA-Log

# Test for no arguments
if ( $args.Count -eq 0 ) 
	{ 
	AAA-Alert `
		"Must supply 1 or multiple elements... ", `
		"Elements are Files or Folders";

	return;  
	}

$xElement = $args[0];

# consume 1st argument
switch ( File-Path-Type $xElement  ) 
	{
	0	{ "Invalid path...";  }
	1	{ GUI-Properties-File $xElement	}
	2	{ GUI-Properties-Folder $xElement	}
	}

$PID
Start-Sleep -Seconds 1

# Interruptible pause
while ( -not [console]::KeyAvailable )
	{ Write-Host -NoNewline "."; Start-Sleep -Milliseconds 64 }


