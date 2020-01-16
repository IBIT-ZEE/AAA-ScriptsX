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

	$xOptions = $xClasses;
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
	"" 
	)


# GOOOOOO!!!!!
Main
