:: AAA eXternal simplification for log operation and show available descendants 
:: >:OBS

:BEGIN
	setlocal
	Call aaa-log %~0 %*	

:MAIN
	:: if no parameter
	:: then recurse for me/itself
	if "%~1"=="" aaa-mainX %~0
	
	set x=c:\dat\#scriptsX\%1.cmd
	if exist %x% call aaa-main %x%
	goto END


:END
	echo,
	echo,
	
	endlocal
	exit /b


:OBS

Marca ~> https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=%*
CLass ~> https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=-1&familia=X

// FIND
// 00HQ | 00HQ%17 | 27E | 27F | nano | dock | ...
https://cpcdi.pt/Produtos/PesquisaLivre?texto=X


// CLASSES
https://cpcdi.pt/PesquisaAvancada/FiltroCaracteristica?limite=30&cod_categoria=8&cod_sub_categoria=72&ChaveRelacionamento=75&categoria=Componentes e Periféricos&subCategoria=Processadores
https://cpcdi.pt/PesquisaAvancada/FiltroCaracteristica?limite=30&cod_categoria=25&cod_sub_categoria=36&ChaveRelacionamento=40&categoria=Monitores%20e%20Acessórios&subCategoria=Monitores


// BRAND+CLASS
// ACER/ASUS/...
// Monitores_TFT/Placas_Graficas/...
https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=X&familia=Y

:
	


