call AAA-Log %0 %*

:MAIN
	aaa-main %~f0
	goto :END


:END
	echo,
	echo,

	exit /b


:OBS
WWW-*

	*-dropper _____ search for file(s) in pre-defined engines

	*-Bing _____ http://bing.com/search?q=<what>
	*-Google ___ http://google.com/search?q=<what>
	*-Duck _____ http://duckduckgo.com/???
	
	*-DNS ______ selected DNS analitycs
	*-WHOIS ____ selected whois service

: