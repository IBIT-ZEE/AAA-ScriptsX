<#

	|B|2|B|
	|C|P|C|D|I|

#>

Set-StrictMode -Version 5;

$xBrowser = "C:\APL\Opera\Browser\launcher.exe";
$xProfile = '--user-data-dir="C:\XXX\Opera\ZEE"';

$xURLFilter = "https://www.cpcdi.pt/PesquisaAvancada/FiltroCaracteristica?cod_categoria={0}&cod_sub_categoria={1}&ChaveRelacionamento={2}&limite=100";
$xURLBrand  = "https://cpcdi.pt/Produtos/PesquisaIntermedia?marca={0}";
$xURLClass  = "https://www.cpcdi.pt/Produtos/PesquisaIntermedia?familia={0}&marca=-1";
$xURLClbr   = "https://www.cpcdi.pt/Produtos/PesquisaIntermedia?marca={0}&familia={1}";
$xURLDomain = "https://cpcdi.pt/PesquisaAvancada/PesquisaInterCategoria?cod_categoria={0}";


# MAIN
Function Main()
	{
	AAA-Log;
	AAA-Alert "", "CPC-DI" , "";

	$xData = Array-Load ( $AAA.Folders.AAA + '\_data\cpc-go.dat' );

	$xOptions = $xData.Name;
	$xGroups  = $xData.Group;
	$xArgs    = $xData.Arguments

	$xOptions += "Quit!"
	$xGroups  += "more..."

	$xIndex = AAA-Menu $xOptions $xGroups;

	if ( $xIndex -eq $xOptions.Length -1 ) { return; }

	switch ( $xGroups[ $xIndex ] ) 
		{
		"Filter"
			{ 
			Start-Process `
				-FilePath $xBrowser `
				-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLFilter -f ( $xArgs[ $xIndex ] -split ",\s*")))
			}

		"Class" 
			{  
			Start-Process `
				-FilePath $xBrowser `
				-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLClass -f $xArgs[ $xIndex ] ));
			
			}

		"Brand" 
			{
			Start-Process `
			-FilePath $xBrowser `
			-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLBrand -f $xArgs[ $xIndex ] ));

			}

		"Class+Brand" 
			{
			Start-Process `
			-FilePath $xBrowser `
			-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLClBr -f ($xArgs[ $xIndex ] -split ",\s*" )));

			}

		"Other" 
			{
			Start-Process `
			-FilePath $xBrowser `
			-ArgumentList ( "{0} {1}" -f $xProfile, ( $xURLDomain -f $xArgs[ $xIndex ] ) )

			}


		Default {}
		}
	}


# GOOOOOO!!!!!
Main


