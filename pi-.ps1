###############################################################################
#
# Self lister for AAA-* auto-discovery
#



AAA-Log

@"


"@

AAA-Script-List

if ( (Get-ChildItem -path env:pi-*) -eq $null )
	{ String-Center ( "<no pi- class properties defined>" ) }
else
{ Get-ChildItem -Path env:\pi-* | % { String-Center (String-Edge  $_.key $_.value -xFill "_" -xSize ($Host.UI.RawUI.WindowSize.Width /2) ) } }

@"

"@

