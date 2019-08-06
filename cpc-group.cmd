call AAA-Log %0 %*

:INIT

:BEGIN


:GO
	Call aaa-main %0
	if "%1"=="" goto :END
	
	opera-browser.cmd https://cpcdi.pt/PesquisaAvancada/PesquisaInterCategoria?cod_categoria=X
	
	goto END


:END
	echo,
	echo,


:FINAL
	exit /b


:OBS

	https://cpcdi.pt/PesquisaAvancada/PesquisaInterCategoria?cod_categoria=X

	GROUPS
	1=PC-Laptop  | 2=PC-Compacts | 3=Storage     | 4=Printing
	5=Project    | 6=Memory      | 7=Scanners    | 8=Components
	9=TV         | 10=Keub&Mouse | 11=Consolas   | 12=Software
	13=Print-Acc | ...
	26=Monitors  | ...

:
