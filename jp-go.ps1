<#

	|B|2|B|
	|J|P|D|I|
	
	Classes
	
	PROMOS    /\ 
	NOVIDADES \/ 
	OUTLET    /\
	TRIGGERS  \/	https://www.jpdi.pt/pt/account.ud121?trigger_event_0=managepricealerts
	ALERTA    /\	https://www.jpdi.pt/pt/account.ud121?trigger_event_0=managelistmanias
	COMPRAS   \/	https://www.jpdi.pt/pt/account.ud121?trigger_event_0=printusertopproductslist

https://www.jpdi.pt/pt/marca/
	ACER
	ASUS
	Brother
	Epson
	JBL
	

https://www.jpdi.pt/pt/produtos/system-components/
	cpu-o-202803
	cpu-o-202803/desktop-o-202929
	cpu-o-202803/desktop-o-202929/?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=INTEL
	cpu-o-202803/desktop-o-202929/?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=AMD
	+
	motherboards-o-202867/desktop-o-202868
	motherboards-o-202867/desktop-o-202868/?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=ASUS
	motherboards-o-202867/?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=GIGABYTE
	motherboards-o-202867/?alt0_attr=brand&alt0_value=MSI&sheet_page=yes&fz=bc
	
https://www.jpdi.pt/pt/produtos/perifericos-o-202689/
	monitores-o-202737/
		?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=<*>
			ACER
			ASUS
			Dell
			HANNS.G
			MP
			LG
			SAMSUNG

	audio-multimedia-e-comunicacao/
		colunas-o-202812/
			?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=MARS+GAMING
			?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=CONCEPTRONIC
			?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=JBL
			
https://www.jpdi.pt/pt/produtos/mobilidade/
	tablet/tablet-o-208795/
		?fz=Filtro%20por%20Marca&alt0_attr=brand&alt0_value=SAMSUNG


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


