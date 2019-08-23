Call IBIT_Log %0 %*


:INIT
	set aavTemp=c:\dat\webdev\_%~n0


:MAIN
	start clover %aavtemp%
	start code %aavtemp% %aavtemp%\_test.css
	start chrome %aavtemp%\_test.html
	::start chrome http://localhost/_testHTML


:END


:FINAL
	set aavTemp=

	

