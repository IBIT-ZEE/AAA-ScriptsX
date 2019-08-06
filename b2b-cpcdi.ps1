<#

DASHBOARD/CLASSE
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=-1&familia=Motherboards_Pcs
Processadores Motherboards_Pcs Caixas

DASHBOARD/BRAND
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=Intel&familia=-1
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=amd

DASHBOARD/CLASS/BRAND
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=nox&familia=Caixas

MIXBOARD/BRAND
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=ACER

MIXBOARD/CLASSE/BRAND
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=Asus&familia=Placas_Graficas

MENU/CLASSES/ITEMS
https://cpcdi.pt/PesquisaAvancada/PesquisaInterCategoria?cod_categoria=6
1=Portateis 2=PCs 3=Discos (...) 6=Memoria (...) 12=Software (...)

QUERY/CLASS/BRAND/SPECS
https://cpcdi.pt/PesquisaAvancada/FiltroCaracteristica?limite=100&cod_categoria=19&cod_sub_categoria=119&ChaveRelacionamento=155&categoria=Redes&subCategoria=Routers

LIST/CLASSES/BRAND
https://cpcdi.pt/Produtos/ListagemProdutos?familia=Memorias_Portateis&marca=Kingston_ValueRAM


#>

########################################
#  |B|2|B|
#  |C|P|C|D|I|
#


# Param( $p1="123", $p2 )

AAA-Log
"CPC-DI`n`n"

$xURLSearch     = "https://cpcdi.pt/Produtos/PesquisaLivre?texto=%{0}%"
$xURLBrandsAll  = "https://cpcdi.pt/Produtos/PesquisaIntermedia?marca={0}"
$xURLClassesAll = "https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=-1&familia={0}"

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
	"Zebra" )


$xClasses = @(
	"PCs", "PCs_Acessórios", "PCs_de_Rede",
	"Portateis", "Portateis_Acessorios",
	"Placas_de_Rede", "Placas_de_Som", "Placas_Graficas",
	"Servidores", "Servidores_Opcoes",
	"Gaming_PC_Acessórios",
	"Workstation",

	"Motherboards_Pcs", "Motherboard_Acessórios",
	
	"Monitores_TFT", "Monitores_Acessorios",
	"Monitores_Profissionais", "Monitores_Profissionais_Acessorios",
	"Monitores_Interativos", "Monitores_Interativos_Acessorios",

	"Colunas_de_Som",

	"Memorias_PCs", "Memorias_Portateis",
	"Memorias_Cartoes", "Memorias_Especificas", "Memorias_USB",

	"SW_Sistemas_Operativos", "SW_Servidores", 
	"SW_OFFICE", "SW_Office_Aplicacoes", "SW_Office_Mac",
	"Software de Gestão", "Software_de_Faturação",
	"Software_Serviços de Cloud",
	"Soluções_de_Arrefecimento",
	"Storage", "Storage_Acessórios", "Storage_Software",

	"Acess Point",	"Adaptadores_e_Cabos",
	"Barebones", 
	"Caixas", "Caixas_Registadoras", 

	"Conectividade", 
	"Discos_Externos", "Discos_HDD", "Discos_SSD", "Discos_SSHD",
	"Drives_Opticas", 
	"Drones",
	"Gestao_de_Potencia",
	"Home_Cinema", "Home_Solutions",
	"Imagem_e_Som",
	"Impressoras_3D", "Impressoras_3D_Acessórios", "Impressoras_3D_Consumiveis",
	"Impressoras_Acessórios", 
	"Impressoras_Jacto_de_Tinta_A2", "Impressoras_Jacto_de_Tinta_A3", "Impressoras_Jacto_de_Tinta_A4",
	"Impressoras_Jacto_Tinta_Consumiveis", "Impressoras_Jacto_Tinta_Diversos",
	"Impressoras_Jacto_Tinta_Papeis", "Impressoras_Jacto_Tinta_Tabuleiros",
	"Impressoras_Laser_Cores_A3", "Impressoras_Laser_Cores_A4", 
	"Impressoras_Laser_Mono_A3", "Impressoras_Laser_Mono_A4",
	"Impressoras_Matriciais",
	"Impressoras_Multifuncoes_Jacto_Tinta",	"Impressoras_Multifuncoes_Laser",
	"Impressoras_Portateis", "Impressoras_Termica",
	"Plotters",	"Plotters_Alimentadores", "Plotters_Consumiveis", "Plotters_Discos",
	"Plotters_Diversos", "Plotters_Manuseamento_Papel", "Plotters_Papeis",
	"Plotters_Suportes", 

	"Jogos",
	"KVM_Switch",
	"Leitor_MP3", "Leitores_SmartCard",
	"Licenças",

	"Modems",

	"Multimedia",


	"POS_Acessorios", "POS_Balanças", "POS_Consumiveis", "POS_Impressoras",
	"POS_Leitores_codigos_barra", "POS_Monitores", "POS_Scanners", "POS_Terminais",
	"Power_Banks",
	"Processadores",
	"Produtos_Desenvolvimento",

	"Ratos_para_PCs", "Ratos_para_Portateis",

	"Redes", "Redes_Converters", "Redes_Diversos", "Redes_Media_Converters",
	"Redes_Powerline", "Redes_Routers", "Redes_Switch", "Redes_Transceivers", "Redes_Wireless",

	"Reguladores_de_corrente",
	"Relógios_Desportivos", "Relógios_Desportivos_Acessórios",
	"Robots Educativos", "Robots Educativos_Acessórios",
	"Scanners",	"Scanners_Acessorios",
	"Secretária_Acessorios",
	"Segurança_e_Ambiente",
	"Sistemas de Gestão de vez",

	"Sistemas_Audio",
	"Sistemas_de_POS",
	"Sistemas_Iluminação",

	"Smart Digital Pen",
	"SmartBands", "SmartBands_Acessórios",
	"Smartphones", "Smartphones_Acessorios",
	"SmartWatch", "SmartWatch_Acessorios",

	"Tablets", "Tablets_Acessórios",
	"Teclados", "Teclados_e_Ratos",

	"Telas_de_Projeção",
	"Televisores", "Televisores_Acessorios",
	"Tomadas", "Tomadas_Acessorios",

	"UPS_para_PCs",	"UPS_para_Servidores", "UPS_PCs_Acessorios", "UPS_Servidores_Acessorios",

	"Videoconferência_acessórios",

	"VideoProjectores", "VideoProjectores_Acessorios",
	"Videovigilância", "Videovigilância_Acessórios",
	"Visualizadores",
	"WebCam",
	"" )


###############################################################################
## LIB
#

function aaaSearch()
	{
	# $x = [Microsoft.VisualBasic.Interaction]::InputBox( "Texto", "Procurar..." )
	AAA-Log

	$x = Read-Host -Prompt "What ? " 

	if ( $x -eq "" ) { Return }
	Start-Process -FilePath "opera.cmd" -ArgumentList ( $xURLSearch -f $x )
	Return
	}


function aaaBrands()
	{
	$xIndex = AAA-Menu( $xBrands );
	Start-Process -FilePath "opera.cmd" -ArgumentList $xURLBrandsAll -f $xBrands[ $xIndex ]
	}


function aaaClasses()
	{
	$xIndex = AAA-Menu( $xClasses );
	Start-Process -FilePath "opera.cmd" -ArgumentList $xURLClassesAll -f $xClasses[ $xIndex ]
	}




###############################################################################
## MAIN
#

Add-Type -AssemblyName "Microsoft.Visualbasic"

$xOptionsMain = @( 
	"Brands", "Classes", "", 
	"Search...", "Exit...", "", 
	"1.(Edit-Classes)", "2.(Edit-Brands)"
	);

$xIndex = AAA-Menu( $xOptionsMain );

switch ( $xIndex ) 
	{
	0 { aaaBrands  }
	1 { aaaClasses  }
	3 { aaaSearch  }
	Default {}
	}

# List-Load( "b2b-cpcdi-Brands.dat" )

break x

# $xTable = Array-Load( "{0}\`$KBZ\b2b-cpcdi.dat" -f $AAA.DAT )
# $xIndex = AAA-Menu( $xTable.Id )


# $z = [System.Collections.Generic.List[string]]::new()
# foreach( $e in $xClasses ){ $z.Add( $e )  }


Out-GridView -InputObject $xClasses

$xIndex = AAA-Menu( $xMarcas )

"`n"

for ( $x = 0; $x -le 100; $x++ ) 
	{ Write-Progress -Activity "Running..." -Status "$x" -PercentComplete "$x"; Start-Sleep -Milliseconds 1 }

"`n`n"

