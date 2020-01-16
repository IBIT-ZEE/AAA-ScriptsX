<#

	|B|2|B|
	|C|P|C|D|I|

#>

Set-StrictMode -Version 5;

$xBrowser = "C:\APL\Opera\Browser\launcher.exe";
$xProfile = '--user-data-dir="C:\XXX\Opera\ZEE"';

$xURLBrand  = "https://cpcdi.pt/Produtos/PesquisaIntermedia?marca={0}";


# MAIN
Function Main()
	{
	AAA-Log;
	AAA-Alert "", "CPC-DI" , "";

	# $xData = Array-Load ( $AAA.Folders.AAA + '\_data\cpc-go.dat' );

	$xOptions = $xBrands;
	$xGroups  = @();

	# Auto-Groupping by 1st Letter
	#for( $x = 0; $x -lt $xOptions.Length; $x++ ) 
	#	{ $xGroups += 1 + [Math]::Floor( $x / 10 ) }

	$xOptions += "Quit!"
	# $xGroups  += "more..."

	$xIndex = AAA-Menu $xOptions $xGroups;

	if ( $xIndex -eq $xOptions.Length -1 ) { return; }

	Start-Process `
	-FilePath $xBrowser `
	-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLBrand -f $xOptions[ $xIndex ] ));

	}

$xBrands = @( 
	"Acer", "AMD", "APC", "Apple", "Archos", "Asus", "AverMedia",
	"Benq", "Birch", "Brother",
	"Canon", "Casio", "Componentes", "Conceptronic", "Cooler_Master", "Corsair", "Creative",
	"Datalogic", "Di", "D-link", "Drift", "Dynabook (Toshiba)",
	"Eaton", "Edimax", "EGG", "Epson", "Equip",
	"FEC",
	"Genius", "Godex", "Goodram",
	"HGST", "Honeywell_Metrologic", "HOPESTAR", "HP", "HPE", "HUAWEI",
	"IBM", "Identive", "Integral", "Intel", "Iris",
	"Kingston", "Kingston_ValueRAM", "Krom",
	"Lenovo", "LevelOne", "Lexmark", "LG",
	"Microsoft", "Microsoft_OEM", "MSI",
	"Napofix", "Neffos", "Netgear", "NGS", "Nikon", "NOMADESK", "Nox",
	"Oki", "Olympus",
	"Panda", "Parrot", "Philips", "PlusScreen", "Port_Designs",
	"Razer", "Samsung", "Sandisk", "Seagate", "Sigma", "Simplee", "Sitten", "Sony", "Storex", "Symantec", "Symbol_Zebra",
	"Targus", "TEM", "TomTom", "Toshiba", "TP-Link", "Transcend", "Trust",
	"UNYKAch", 
	"ViewSonic",
	"Western_Digital", 
	"Xprinter",
	"Zebra" 
	)

# GOOOOOO!!!!!
Main
