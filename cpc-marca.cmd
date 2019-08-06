call AAA-Log %0 %*

:INIT

:BEGIN


:GO
	Call aaa-main %0
	if "%1"=="" goto :END
	
	opera-browser.cmd https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=%*

	goto END


:END
	echo,
	echo,


:FINAL
	exit /b


:OBS

	https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=%*


	ACER / ASUS / INTEL / *
	
	BROTHER / CANON / EPSON / HP / KINGSTON / LG / NETGEAR / OKI / 
	SAMSUNG / TOSHIBA / TP-LINK / *
	
	APPLE / BIRCH / AMD / ARCHOS / CRUCIAL / DLINK / *
	UNIKA / 
:
