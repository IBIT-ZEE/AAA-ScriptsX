param( $xName ); 

if ( $null -eq $xName )
	{
	AAA-Logo
	AAA-Alert "Indique um filtro", "Wildcards admited..."
	return
	} 

Get-NetFirewallRule -DisplayName $xName `
	| Format-Table -Property DisplayName, Direction, Action, PrimaryStatus, Profile, Owner -AutoSize 

