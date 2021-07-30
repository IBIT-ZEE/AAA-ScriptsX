
# 2LIB*** AAA::* NumberOrDefault / StringOrDefault / ...
try { $x = [System.Convert]::ToInt32( $args[0] ) } catch{ $x = 1 }

Get-WinEvent `
	-FilterHashtable `
		@{
		logname="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall"; 
		id=2004; 
		StartTime=(Get-Date).AddMinutes( -$x ); 
		} `
	-ErrorAction SilentlyContinue `
	| Format-List `
		-Property TimeCreated, MachineName, UserId, LevelDispalyName, Message

"

* Events from last minutes/$x...

"
