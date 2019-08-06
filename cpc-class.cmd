call AAA-Log %0 %*

:INIT

:BEGIN


:GO
	Call aaa-main %0
	if "%1"=="" goto :END
	
	opera-browser.cmd https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=-1&familia=X

	
	goto END


:END
	echo,
	echo,


:FINAL
	exit /b


:OBS
	https://cpcdi.pt/Produtos/PesquisaIntermedia?marca=-1&familia=X

	Classes:
	
	processadores / Motherboards_Pcs:
:
