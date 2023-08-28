call AAA-Log %0 %*  


:MAIN
	if "%1"=="" ( AAA-Obs %0 ) 
	exit /b 


:OBS
	***2DO script-type-processor 
	***ATT _space-in-label_ 
  
