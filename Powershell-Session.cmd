
<#
ZEE 2020.06.18

Console from a remote Powershell session

PS-Session <xPC> [<xCredentials>]

#>



Param( $xPC, $xCredential )

AAA-Logo;

# Computer/Device name is mandatory...
if ( $null -eq $xPC )
	{

"Syntax:

	PS-Session <PC> [<Credentials>]

"
	Return
	}

if ( $null -eq $xCredential ) 
	{
	# not workable because it is a Command-Line always-new process
	# $xCredential = $AAA.Credential;
	#
	# Catch ESC/Error in credential dialog
	try 
		{ if ( $null -eq $xCredential ) { $xCredential = Get-Credential } }
	catch 
		{ Return }

	}


Start-Process `
	-FilePath "$pshome\powershell.exe" `
	-ArgumentList "-noexit", "-command", "Enter-PSSession $xPC -credential $xCredential"

