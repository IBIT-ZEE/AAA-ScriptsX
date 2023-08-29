@call AAA-Log %0 %*  


:MAIN 
	if "%1"=="" ( AAA-Obs %0 ) 

	for %%f in ( %aaa-scripts% %aaa-scriptsX% %aaa-scriptsXX% ) do (
	
		echo %%f\*%1*
		call ls %%f\*%1*
		echo,
		)
	
	exit /b 


:OBS
	Syntax:

		Script-List <filter*?>
  
