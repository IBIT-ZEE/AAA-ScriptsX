<#

	|C|P|C|D|I|
		|B|2|B|

#>

Set-StrictMode -Version 5;

$xBrowser = "C:\APL\Opera\Browser\launcher.exe";
$xProfile = '--user-data-dir="C:\XXX\Opera\ZEE"';
$xURLSearch = "https://www.cpcdi.pt/Produtos/PesquisaLivre?texto={0}"

# MAIN

AAA-Log;
AAA-Alert "", "CPC-DI" , "";

# Add-Type -AssemblyName "Microsoft.Visualbasic";
# $x = [Microsoft.VisualBasic.Interaction]::InputBox( "Texto", "Procurar..." )

# stringfy and collapse $args
$xArgs = $args -join " "

# ?are there ARGUMENTS passed or ASK for some???
if ( $xArgs -eq "" ) { $xArgs = Read-Host -Prompt "What ? "  }

if ( $xArgs -eq "" ) { Return }

Start-Process `
	-FilePath $xBrowser `
	-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLSearch -f $xArgs ) );







