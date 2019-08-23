Call IBIT_Log %0 %*


:INIT
	set aavTemp=c:\dat\webdev\_%~n0


:MAIN
	start clover %aavtemp%
	start /B code %aavtemp% %aavtemp%\_test.js
	start nodex
	start chrome http://localhost:1111
	
:END


:FINAL
	set aavTemp=


	